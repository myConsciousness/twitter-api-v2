// Copyright 2022 Kato Shinya. All rights reserved.
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided the conditions.

// Dart imports:
import 'dart:async';
import 'dart:convert';

// Package imports:
import 'package:twitter_api_core/twitter_api_core.dart' as core;

// Project imports:
import 'common/data.dart';
import 'common/includes.dart';
import 'common/meta.dart';
import 'common/rate_limit.dart';
import 'pagination/bidirectional_pagination.dart';
import 'pagination/forward_pageable.dart';
import 'pagination/pageable.dart';
import 'pagination/unidirectional_pagination.dart';
import 'response/pagination_response.dart';
import 'response/response_field.dart';
import 'response/twitter_response.dart';

/// The callback function for building data object from response.
typedef DataBuilder<D extends Data> = D Function(Map<String, Object?> json);

/// The callback function for building meta object from response.
typedef MetaBuilder<M extends Meta> = M Function(Map<String, Object?> json);

abstract class _Service {
  Future<core.Response> get(
    core.UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  });

  Future<core.StreamResponse> getStream(
    final core.UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  });

  Future<core.Response> post(
    core.UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, String> body = const {},
  });

  Future<core.Response> delete(
    core.UserContext userContext,
    String unencodedPath,
  );

  Future<core.Response> put(
    core.UserContext userContext,
    String unencodedPath, {
    Map<String, String> body = const {},
  });

  TwitterResponse<D, M>
      transformSingleDataResponse<D extends Data, M extends Meta>(
    core.Response response, {
    required DataBuilder<D> dataBuilder,
    MetaBuilder<M>? metaBuilder,
  });

  TwitterResponse<List<D>, M>
      transformMultiDataResponse<D extends Data, M extends Meta>(
    core.Response response, {
    required DataBuilder<D> dataBuilder,
    MetaBuilder<M>? metaBuilder,
  });

  Future<PaginationResponse<List<D>, M>>
      getPage<D extends Data, M extends Meta>(
    core.UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  });

  Future<void> executePaginationIfNecessary<D extends Data, M extends Pageable>(
    core.UserContext userContext,
    String unencodedPath,
    Map<String, dynamic> queryParameters, {
    required Paging<List<D>, M>? paging,
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  });

  Future<void> executeForwardPaginationIfNecessary<D extends Data,
      M extends ForwardPageable>(
    core.UserContext userContext,
    String unencodedPath,
    Map<String, dynamic> queryParameters, {
    required ForwardPaging<List<D>, M>? paging,
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  });

  TwitterResponse<bool, void> evaluateResponse(final core.Response response);
}

abstract class BaseService implements _Service {
  /// Returns the new instance of [BaseService].
  BaseService({required core.ClientContext context})
      : _helper = core.ServiceHelper(
          authority: 'api.twitter.com',
          context: context,
        );

  final core.ServiceHelper _helper;

  final ResponseHeaderConverter headerConverter =
      const ResponseHeaderConverter();

  @override
  Future<core.Response> get(
    final core.UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
  }) async =>
      await _helper.get(
        userContext,
        unencodedPath,
        queryParameters: queryParameters,
        validate: (response) {
          _checkGetResponse(response, response.body);

          return response;
        },
      );

  @override
  Future<core.StreamResponse> getStream(
    final core.UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    Map<String, dynamic> Function(
            core.StreamedResponse streamedResponse, String event)?
        validate,
  }) async =>
      await _helper.getStream(
        userContext,
        unencodedPath,
        queryParameters: queryParameters,
        validate: (response, event) {
          _checkGetResponse(response, event);

          final jsonBody = jsonDecode(event);
          if (!jsonBody.containsKey(ResponseField.data.value)) {
            throw core.DataNotFoundException(
              'No data exists in response.',
              response,
              event,
            );
          }

          return jsonBody;
        },
      );

  @override
  Future<core.Response> post(
    final core.UserContext userContext,
    final String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    dynamic body = const {},
    core.Response Function(core.Response response)? validate,
  }) async =>
      await _helper.post(
        userContext,
        unencodedPath,
        queryParameters: queryParameters,
        body: body,
        validate: checkResponse,
      );

  @override
  Future<core.Response> delete(
    final core.UserContext userContext,
    final String unencodedPath, {
    core.Response Function(core.Response response)? validate,
  }) async =>
      await _helper.delete(
        userContext,
        unencodedPath,
        validate: checkResponse,
      );

  @override
  Future<core.Response> put(
    final core.UserContext userContext,
    final String unencodedPath, {
    dynamic body = const {},
    core.Response Function(core.Response response)? validate,
  }) async =>
      await _helper.put(
        userContext,
        unencodedPath,
        body: body,
        validate: checkResponse,
      );

  @override
  TwitterResponse<D, M>
      transformSingleDataResponse<D extends Data, M extends Meta>(
    core.Response response, {
    required DataBuilder<D> dataBuilder,
    MetaBuilder<M>? metaBuilder,
  }) {
    final jsonBody = _checkResponseBody(response);

    return TwitterResponse(
      rateLimit: RateLimit.fromJson(
        headerConverter.convert(response.headers),
      ),
      data: dataBuilder(
        jsonBody[ResponseField.data.value],
      ),
      includes: jsonBody.containsKey(ResponseField.includes.value)
          ? Includes.fromJson(jsonBody[ResponseField.includes.value])
          : null,
      meta:
          jsonBody.containsKey(ResponseField.meta.value) && metaBuilder != null
              ? metaBuilder(jsonBody[ResponseField.meta.value])
              : null,
    );
  }

  @override
  TwitterResponse<List<D>, M>
      transformMultiDataResponse<D extends Data, M extends Meta>(
    core.Response response, {
    required DataBuilder<D> dataBuilder,
    MetaBuilder<M>? metaBuilder,
  }) {
    final jsonBody = _checkResponseBody(response);

    return TwitterResponse(
      rateLimit: RateLimit.fromJson(
        headerConverter.convert(response.headers),
      ),
      data: jsonBody[ResponseField.data.value]
          .map<D>((tweet) => dataBuilder(tweet))
          .toList(),
      includes: jsonBody.containsKey(ResponseField.includes.value)
          ? Includes.fromJson(jsonBody[ResponseField.includes.value])
          : null,
      meta:
          jsonBody.containsKey(ResponseField.meta.value) && metaBuilder != null
              ? metaBuilder(jsonBody[ResponseField.meta.value])
              : null,
    );
  }

  @override
  Future<PaginationResponse<List<D>, M>>
      getPage<D extends Data, M extends Meta>(
    core.UserContext userContext,
    String unencodedPath, {
    Map<String, dynamic> queryParameters = const {},
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  }) async {
    final response = await get(
      userContext,
      unencodedPath,
      queryParameters: queryParameters,
    );

    final jsonBody = _checkResponseBody(response);

    return PaginationResponse(
      userContext: userContext,
      unencodedPath: unencodedPath,
      queryParameters: queryParameters,
      rateLimit: RateLimit.fromJson(
        headerConverter.convert(response.headers),
      ),
      data: jsonBody[ResponseField.data.value]
          .map<D>((tweet) => dataBuilder(tweet))
          .toList(),
      includes: jsonBody.containsKey(ResponseField.includes.value)
          ? Includes.fromJson(jsonBody[ResponseField.includes.value])
          : null,
      meta: jsonBody.containsKey(ResponseField.meta.value)
          ? metaBuilder(jsonBody[ResponseField.meta.value])
          : null,
    );
  }

  @override
  Future<PaginationResponse<List<D>, M>>
      executePaginationIfNecessary<D extends Data, M extends Pageable>(
    core.UserContext userContext,
    String unencodedPath,
    Map<String, dynamic> queryParameters, {
    required Paging<List<D>, M>? paging,
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  }) async {
    final rootPage = await getPage<D, M>(
      userContext,
      unencodedPath,
      queryParameters: queryParameters,
      dataBuilder: dataBuilder,
      metaBuilder: metaBuilder,
    );

    if (paging != null) {
      await BidirectionalPagination(
        rootPage,
        paging,
        (userContext, unencodedPath, queryParameters) async =>
            await getPage<D, M>(
          userContext,
          unencodedPath,
          queryParameters: queryParameters,
          dataBuilder: dataBuilder,
          metaBuilder: metaBuilder,
        ),
      ).execute();
    }

    return rootPage;
  }

  @override
  Future<PaginationResponse<List<D>, M>> executeForwardPaginationIfNecessary<
      D extends Data, M extends ForwardPageable>(
    core.UserContext userContext,
    String unencodedPath,
    Map<String, dynamic> queryParameters, {
    required ForwardPaging<List<D>, M>? paging,
    required DataBuilder<D> dataBuilder,
    required MetaBuilder<M> metaBuilder,
  }) async {
    final rootPage = await getPage<D, M>(
      userContext,
      unencodedPath,
      queryParameters: queryParameters,
      dataBuilder: dataBuilder,
      metaBuilder: metaBuilder,
    );

    if (paging != null) {
      await UnidirectionalPagination<List<D>, M>(
        rootPage,
        paging,
        (userContext, unencodedPath, queryParameters) async =>
            await getPage<D, M>(
          userContext,
          unencodedPath,
          queryParameters: queryParameters,
          dataBuilder: dataBuilder,
          metaBuilder: metaBuilder,
        ),
      ).execute();
    }

    return rootPage;
  }

  @override
  TwitterResponse<bool, void> evaluateResponse(final core.Response response) =>
      TwitterResponse(
        rateLimit: RateLimit.fromJson(
          headerConverter.convert(response.headers),
        ),
        data: _evaluateResponse(response),
      );

  bool _evaluateResponse(final core.Response response) {
    if (response.statusCode == 204) {
      //! 204: No Content.
      return true;
    }

    if (response.statusCode == 200 && response.body.isEmpty) {
      //! No JSON in response but okay, it's succeeded.
      return true;
    }

    return !core
        .tryJsonDecode(response, response.body)
        .containsKey(ResponseField.errors.value);
  }

  Map<String, dynamic> _checkResponseBody(final core.Response response) {
    final jsonBody = core.tryJsonDecode(response, response.body);

    if (!jsonBody.containsKey(ResponseField.data.value)) {
      //! This occurs when the tweet to be processed has been deleted or
      //! when the target data does not exist at the time of search.
      throw core.DataNotFoundException(
        'No data exists in response.',
        response,
      );
    }

    return jsonBody;
  }

  core.Response checkResponse(
    final core.Response response,
  ) {
    if (response.statusCode == 401) {
      throw core.UnauthorizedException(
        'The specified access token is invalid.',
        response,
      );
    }

    if (response.statusCode == 204) {
      //! 204: No Content.
      return response;
    }

    if (response.statusCode == 200 && response.body.isEmpty) {
      //! No JSON in response but okay, it's succeeded.
      return response;
    }

    final jsonBody = core.tryJsonDecode(response, response.body);

    if (jsonBody.containsKey(ResponseField.errors.value)) {
      final errors = jsonBody[ResponseField.errors.value];
      for (final error in errors) {
        if (error['code'] == 88) {
          throw core.RateLimitExceededException(
            error['message'] ?? '',
            response,
          );
        }
      }
    }

    return response;
  }

  void _checkGetResponse(
    final core.BaseResponse response,
    final String event,
  ) {
    if (response.statusCode == 401) {
      throw core.UnauthorizedException(
        'The specified access token is invalid.',
        response,
      );
    }

    final jsonBody = core.tryJsonDecode(response, event);

    if (jsonBody.containsKey(ResponseField.errors.value)) {
      final errors = jsonBody[ResponseField.errors.value];

      for (final error in errors) {
        if (error['code'] == 88) {
          throw core.RateLimitExceededException(
            error['message'] ?? '',
            response,
          );
        }
      }
    }
  }
}

class ResponseHeaderConverter {
  const ResponseHeaderConverter();

  Map<String, dynamic> convert(final Map<String, String> input) => {
        //! Although it rarely occurs, there is a case where the header does not
        //! contain rate limiting information.
        'x-rate-limit-limit': _getInt(input, 'x-rate-limit-limit'),
        'x-rate-limit-remaining': _getInt(input, 'x-rate-limit-remaining'),
        'x-rate-limit-reset': _getDateTimeString(input, 'x-rate-limit-reset'),
      };

  int _getInt(final Map<String, String> input, final String key) =>
      input.containsKey(key) ? int.parse(input[key]!) : 0;

  String _getDateTimeString(final Map<String, String> input, final String key) {
    if (!input.containsKey(key)) {
      return DateTime.fromMillisecondsSinceEpoch(0).toString();
    }

    return DateTime.fromMillisecondsSinceEpoch(
      int.parse(input[key]!) * 1000,
    ).toString();
  }
}
