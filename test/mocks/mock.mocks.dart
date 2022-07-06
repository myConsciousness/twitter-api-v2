// Mocks generated by Mockito 5.2.0 from annotations
// in twitter_api_v2/test/mocks/mock.dart.
// Do not manually edit this file.

// Dart imports:
import 'dart:async' as _i4;

// Package imports:
import 'package:http/http.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// Project imports:
import 'package:twitter_api_v2/src/client/client_context.dart' as _i3;
import 'package:twitter_api_v2/src/client/user_context.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeResponse_0 extends _i1.Fake implements _i2.Response {}

class _FakeStreamedResponse_1 extends _i1.Fake implements _i2.StreamedResponse {
}

/// A class which mocks [ClientContext].
///
/// See the documentation for Mockito's code generation for more information.
class MockClientContext extends _i1.Mock implements _i3.ClientContext {
  MockClientContext() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get hasOAuth1Client => (super
          .noSuchMethod(Invocation.getter(#hasOAuth1Client), returnValue: false)
      as bool);
  @override
  _i4.Future<_i2.Response> get(_i5.UserContext? userContext, Uri? uri) =>
      (super.noSuchMethod(Invocation.method(#get, [userContext, uri]),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> post(_i5.UserContext? userContext, Uri? uri,
          {Map<String, String>? headers = const {}, dynamic body}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #post, [userContext, uri], {#headers: headers, #body: body}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> delete(_i5.UserContext? userContext, Uri? uri) =>
      (super.noSuchMethod(Invocation.method(#delete, [userContext, uri]),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.Response> put(_i5.UserContext? userContext, Uri? uri,
          {Map<String, String>? headers = const {}, dynamic body}) =>
      (super.noSuchMethod(
              Invocation.method(
                  #put, [userContext, uri], {#headers: headers, #body: body}),
              returnValue: Future<_i2.Response>.value(_FakeResponse_0()))
          as _i4.Future<_i2.Response>);
  @override
  _i4.Future<_i2.StreamedResponse> getStream(
          _i5.UserContext? userContext, _i2.BaseRequest? request) =>
      (super.noSuchMethod(Invocation.method(#getStream, [userContext, request]),
              returnValue:
                  Future<_i2.StreamedResponse>.value(_FakeStreamedResponse_1()))
          as _i4.Future<_i2.StreamedResponse>);
}
