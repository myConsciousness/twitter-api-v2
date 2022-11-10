// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'locale.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Locale _$LocaleFromJson(Map<String, dynamic> json) {
  return _Locale.fromJson(json);
}

/// @nodoc
mixin _$Locale {
  /// The language
  Language get lang => throw _privateConstructorUsedError;

  /// The country
  Country get country => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocaleCopyWith<Locale> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocaleCopyWith<$Res> {
  factory $LocaleCopyWith(Locale value, $Res Function(Locale) then) =
      _$LocaleCopyWithImpl<$Res>;
  $Res call({Language lang, Country country});
}

/// @nodoc
class _$LocaleCopyWithImpl<$Res> implements $LocaleCopyWith<$Res> {
  _$LocaleCopyWithImpl(this._value, this._then);

  final Locale _value;
  // ignore: unused_field
  final $Res Function(Locale) _then;

  @override
  $Res call({
    Object? lang = freezed,
    Object? country = freezed,
  }) {
    return _then(_value.copyWith(
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Language,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
    ));
  }
}

/// @nodoc
abstract class _$$_LocaleCopyWith<$Res> implements $LocaleCopyWith<$Res> {
  factory _$$_LocaleCopyWith(_$_Locale value, $Res Function(_$_Locale) then) =
      __$$_LocaleCopyWithImpl<$Res>;
  @override
  $Res call({Language lang, Country country});
}

/// @nodoc
class __$$_LocaleCopyWithImpl<$Res> extends _$LocaleCopyWithImpl<$Res>
    implements _$$_LocaleCopyWith<$Res> {
  __$$_LocaleCopyWithImpl(_$_Locale _value, $Res Function(_$_Locale) _then)
      : super(_value, (v) => _then(v as _$_Locale));

  @override
  _$_Locale get _value => super._value as _$_Locale;

  @override
  $Res call({
    Object? lang = freezed,
    Object? country = freezed,
  }) {
    return _then(_$_Locale(
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as Language,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Locale implements _Locale {
  const _$_Locale({required this.lang, required this.country});

  factory _$_Locale.fromJson(Map<String, dynamic> json) =>
      _$$_LocaleFromJson(json);

  /// The language
  @override
  final Language lang;

  /// The country
  @override
  final Country country;

  @override
  String toString() {
    return 'Locale(lang: $lang, country: $country)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Locale &&
            const DeepCollectionEquality().equals(other.lang, lang) &&
            const DeepCollectionEquality().equals(other.country, country));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(lang),
      const DeepCollectionEquality().hash(country));

  @JsonKey(ignore: true)
  @override
  _$$_LocaleCopyWith<_$_Locale> get copyWith =>
      __$$_LocaleCopyWithImpl<_$_Locale>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LocaleToJson(
      this,
    );
  }
}

abstract class _Locale implements Locale {
  const factory _Locale(
      {required final Language lang,
      required final Country country}) = _$_Locale;

  factory _Locale.fromJson(Map<String, dynamic> json) = _$_Locale.fromJson;

  @override

  /// The language
  Language get lang;
  @override

  /// The country
  Country get country;
  @override
  @JsonKey(ignore: true)
  _$$_LocaleCopyWith<_$_Locale> get copyWith =>
      throw _privateConstructorUsedError;
}
