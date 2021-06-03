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
class _$CardTearOff {
  const _$CardTearOff();

  _Card call({CardType cardType = CardType.citizen}) {
    return _Card(
      cardType: cardType,
    );
  }
}

/// @nodoc
const $Card = _$CardTearOff();

/// @nodoc
mixin _$Card {
  CardType get cardType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CardCopyWith<Card> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCopyWith<$Res> {
  factory $CardCopyWith(Card value, $Res Function(Card) then) =
      _$CardCopyWithImpl<$Res>;
  $Res call({CardType cardType});
}

/// @nodoc
class _$CardCopyWithImpl<$Res> implements $CardCopyWith<$Res> {
  _$CardCopyWithImpl(this._value, this._then);

  final Card _value;
  // ignore: unused_field
  final $Res Function(Card) _then;

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
abstract class _$CardCopyWith<$Res> implements $CardCopyWith<$Res> {
  factory _$CardCopyWith(_Card value, $Res Function(_Card) then) =
      __$CardCopyWithImpl<$Res>;
  @override
  $Res call({CardType cardType});
}

/// @nodoc
class __$CardCopyWithImpl<$Res> extends _$CardCopyWithImpl<$Res>
    implements _$CardCopyWith<$Res> {
  __$CardCopyWithImpl(_Card _value, $Res Function(_Card) _then)
      : super(_value, (v) => _then(v as _Card));

  @override
  _Card get _value => super._value as _Card;

  @override
  $Res call({
    Object? cardType = freezed,
  }) {
    return _then(_Card(
      cardType: cardType == freezed
          ? _value.cardType
          : cardType // ignore: cast_nullable_to_non_nullable
              as CardType,
    ));
  }
}

/// @nodoc

class _$_Card extends _Card {
  const _$_Card({this.cardType = CardType.citizen}) : super._();

  @JsonKey(defaultValue: CardType.citizen)
  @override
  final CardType cardType;

  @override
  String toString() {
    return 'Card(cardType: $cardType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Card &&
            (identical(other.cardType, cardType) ||
                const DeepCollectionEquality()
                    .equals(other.cardType, cardType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(cardType);

  @JsonKey(ignore: true)
  @override
  _$CardCopyWith<_Card> get copyWith =>
      __$CardCopyWithImpl<_Card>(this, _$identity);
}

abstract class _Card extends Card {
  const factory _Card({CardType cardType}) = _$_Card;
  const _Card._() : super._();

  @override
  CardType get cardType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CardCopyWith<_Card> get copyWith => throw _privateConstructorUsedError;
}
