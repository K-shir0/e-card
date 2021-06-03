// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EmperorCardTearOff {
  const _$EmperorCardTearOff();

  _EmperorCard call({CardType cardType = CardType.citizen}) {
    return _EmperorCard(
      cardType: cardType,
    );
  }
}

/// @nodoc
const $EmperorCard = _$EmperorCardTearOff();

/// @nodoc
mixin _$EmperorCard {
  CardType get cardType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmperorCardCopyWith<EmperorCard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmperorCardCopyWith<$Res> {
  factory $EmperorCardCopyWith(
          EmperorCard value, $Res Function(EmperorCard) then) =
      _$EmperorCardCopyWithImpl<$Res>;
  $Res call({CardType cardType});
}

/// @nodoc
class _$EmperorCardCopyWithImpl<$Res> implements $EmperorCardCopyWith<$Res> {
  _$EmperorCardCopyWithImpl(this._value, this._then);

  final EmperorCard _value;
  // ignore: unused_field
  final $Res Function(EmperorCard) _then;

  @override
  $Res call({
    Object? cardType = freezed,
  }) {
    return _then(_value.copyWith(
      cardType: cardType == freezed
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
    ));
  }
}

/// @nodoc
abstract class _$EmperorCardCopyWith<$Res>
    implements $EmperorCardCopyWith<$Res> {
  factory _$EmperorCardCopyWith(
          _EmperorCard value, $Res Function(_EmperorCard) then) =
      __$EmperorCardCopyWithImpl<$Res>;
  @override
  $Res call({CardType cardType});
}

/// @nodoc
class __$EmperorCardCopyWithImpl<$Res> extends _$EmperorCardCopyWithImpl<$Res>
    implements _$EmperorCardCopyWith<$Res> {
  __$EmperorCardCopyWithImpl(
      _EmperorCard _value, $Res Function(_EmperorCard) _then)
      : super(_value, (v) => _then(v as _EmperorCard));

  @override
  _EmperorCard get _value => super._value as _EmperorCard;

  @override
  $Res call({
    Object? cardType = freezed,
  }) {
    return _then(_EmperorCard(
      cardType: cardType == freezed
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
    ));
  }
}

/// @nodoc

class _$_EmperorCard extends _EmperorCard {
  const _$_EmperorCard({this.cardType = CardType.citizen}) : super._();

  @JsonKey(defaultValue: CardType.citizen)
  @override
  final CardType cardType;

  @override
  String toString() {
    return 'EmperorCard(cardType: $cardType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmperorCard &&
            (identical(other.cardType, cardType) ||
                const DeepCollectionEquality()
                    .equals(other.cardType, cardType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cardType);

  @JsonKey(ignore: true)
  @override
  _$EmperorCardCopyWith<_EmperorCard> get copyWith =>
      __$EmperorCardCopyWithImpl<_EmperorCard>(this, _$identity);
}

abstract class _EmperorCard extends EmperorCard {
  const factory _EmperorCard({CardType cardType}) = _$_EmperorCard;
  const _EmperorCard._() : super._();

  @override
  CardType get cardType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EmperorCardCopyWith<_EmperorCard> get copyWith =>
      throw _privateConstructorUsedError;
}
