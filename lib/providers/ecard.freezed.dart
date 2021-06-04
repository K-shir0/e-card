// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ecard.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ECardTearOff {
  const _$ECardTearOff();

  _ECard call(
      {List<EmperorCard> player1Deck = const [
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.emperor)
      ],
      List<EmperorCard> player2Deck = const [
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.slave)
      ],
      int? cardChosenByPlayer1,
      int? cardChosenByPlayer2,
      int turn = 0,
      int phase = 0,
      int winFlag = 0,
      bool isHandfulVisible = true,
      bool isCardFront = false}) {
    return _ECard(
      player1Deck: player1Deck,
      player2Deck: player2Deck,
      cardChosenByPlayer1: cardChosenByPlayer1,
      cardChosenByPlayer2: cardChosenByPlayer2,
      turn: turn,
      phase: phase,
      winFlag: winFlag,
      isHandfulVisible: isHandfulVisible,
      isCardFront: isCardFront,
    );
  }
}

/// @nodoc
const $ECard = _$ECardTearOff();

/// @nodoc
mixin _$ECard {
/*
    * デッキ
    */
// プレイヤー1
  List<EmperorCard> get player1Deck =>
      throw _privateConstructorUsedError; // プレイヤー2
  List<EmperorCard> get player2Deck => throw _privateConstructorUsedError;
  /*
    * 選択したカード
    */
  int? get cardChosenByPlayer1 => throw _privateConstructorUsedError;
  int? get cardChosenByPlayer2 => throw _privateConstructorUsedError;
  /*
     * ターン
     */
  int get turn => throw _privateConstructorUsedError;
  /*
     * フェイズ
     */
  int get phase => throw _privateConstructorUsedError;
  /*
     * 勝利フラグ
     * 1 -> プレイヤー1の勝利
     * 2 -> プレイヤー2の勝利
     */
  int get winFlag => throw _privateConstructorUsedError;
  bool get isHandfulVisible => throw _privateConstructorUsedError;
  bool get isCardFront => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ECardCopyWith<ECard> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ECardCopyWith<$Res> {
  factory $ECardCopyWith(ECard value, $Res Function(ECard) then) =
      _$ECardCopyWithImpl<$Res>;
  $Res call(
      {List<EmperorCard> player1Deck,
      List<EmperorCard> player2Deck,
      int? cardChosenByPlayer1,
      int? cardChosenByPlayer2,
      int turn,
      int phase,
      int winFlag,
      bool isHandfulVisible,
      bool isCardFront});
}

/// @nodoc
class _$ECardCopyWithImpl<$Res> implements $ECardCopyWith<$Res> {
  _$ECardCopyWithImpl(this._value, this._then);

  final ECard _value;
  // ignore: unused_field
  final $Res Function(ECard) _then;

  @override
  $Res call({
    Object? player1Deck = freezed,
    Object? player2Deck = freezed,
    Object? cardChosenByPlayer1 = freezed,
    Object? cardChosenByPlayer2 = freezed,
    Object? turn = freezed,
    Object? phase = freezed,
    Object? winFlag = freezed,
    Object? isHandfulVisible = freezed,
    Object? isCardFront = freezed,
  }) {
    return _then(_value.copyWith(
      player1Deck: player1Deck == freezed
          ? _value.player1Deck
          : player1Deck // ignore: cast_nullable_to_non_nullable
              as List<EmperorCard>,
      player2Deck: player2Deck == freezed
          ? _value.player2Deck
          : player2Deck // ignore: cast_nullable_to_non_nullable
              as List<EmperorCard>,
      cardChosenByPlayer1: cardChosenByPlayer1 == freezed
          ? _value.cardChosenByPlayer1
          : cardChosenByPlayer1 // ignore: cast_nullable_to_non_nullable
              as int?,
      cardChosenByPlayer2: cardChosenByPlayer2 == freezed
          ? _value.cardChosenByPlayer2
          : cardChosenByPlayer2 // ignore: cast_nullable_to_non_nullable
              as int?,
      turn: turn == freezed
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      phase: phase == freezed
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int,
      winFlag: winFlag == freezed
          ? _value.winFlag
          : winFlag // ignore: cast_nullable_to_non_nullable
              as int,
      isHandfulVisible: isHandfulVisible == freezed
          ? _value.isHandfulVisible
          : isHandfulVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isCardFront: isCardFront == freezed
          ? _value.isCardFront
          : isCardFront // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$ECardCopyWith<$Res> implements $ECardCopyWith<$Res> {
  factory _$ECardCopyWith(_ECard value, $Res Function(_ECard) then) =
      __$ECardCopyWithImpl<$Res>;
  @override
  $Res call(
      {List<EmperorCard> player1Deck,
      List<EmperorCard> player2Deck,
      int? cardChosenByPlayer1,
      int? cardChosenByPlayer2,
      int turn,
      int phase,
      int winFlag,
      bool isHandfulVisible,
      bool isCardFront});
}

/// @nodoc
class __$ECardCopyWithImpl<$Res> extends _$ECardCopyWithImpl<$Res>
    implements _$ECardCopyWith<$Res> {
  __$ECardCopyWithImpl(_ECard _value, $Res Function(_ECard) _then)
      : super(_value, (v) => _then(v as _ECard));

  @override
  _ECard get _value => super._value as _ECard;

  @override
  $Res call({
    Object? player1Deck = freezed,
    Object? player2Deck = freezed,
    Object? cardChosenByPlayer1 = freezed,
    Object? cardChosenByPlayer2 = freezed,
    Object? turn = freezed,
    Object? phase = freezed,
    Object? winFlag = freezed,
    Object? isHandfulVisible = freezed,
    Object? isCardFront = freezed,
  }) {
    return _then(_ECard(
      player1Deck: player1Deck == freezed
          ? _value.player1Deck
          : player1Deck // ignore: cast_nullable_to_non_nullable
              as List<EmperorCard>,
      player2Deck: player2Deck == freezed
          ? _value.player2Deck
          : player2Deck // ignore: cast_nullable_to_non_nullable
              as List<EmperorCard>,
      cardChosenByPlayer1: cardChosenByPlayer1 == freezed
          ? _value.cardChosenByPlayer1
          : cardChosenByPlayer1 // ignore: cast_nullable_to_non_nullable
              as int?,
      cardChosenByPlayer2: cardChosenByPlayer2 == freezed
          ? _value.cardChosenByPlayer2
          : cardChosenByPlayer2 // ignore: cast_nullable_to_non_nullable
              as int?,
      turn: turn == freezed
          ? _value.turn
          : turn // ignore: cast_nullable_to_non_nullable
              as int,
      phase: phase == freezed
          ? _value.phase
          : phase // ignore: cast_nullable_to_non_nullable
              as int,
      winFlag: winFlag == freezed
          ? _value.winFlag
          : winFlag // ignore: cast_nullable_to_non_nullable
              as int,
      isHandfulVisible: isHandfulVisible == freezed
          ? _value.isHandfulVisible
          : isHandfulVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      isCardFront: isCardFront == freezed
          ? _value.isCardFront
          : isCardFront // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ECard extends _ECard {
  const _$_ECard(
      {this.player1Deck = const [
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.emperor)
      ],
      this.player2Deck = const [
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.citizen),
        const EmperorCard(cardType: CardType.slave)
      ],
      this.cardChosenByPlayer1,
      this.cardChosenByPlayer2,
      this.turn = 0,
      this.phase = 0,
      this.winFlag = 0,
      this.isHandfulVisible = true,
      this.isCardFront = false})
      : super._();

  @JsonKey(defaultValue: const [
    const EmperorCard(cardType: CardType.citizen),
    const EmperorCard(cardType: CardType.citizen),
    const EmperorCard(cardType: CardType.citizen),
    const EmperorCard(cardType: CardType.citizen),
    const EmperorCard(cardType: CardType.emperor)
  ])
  @override
  /*
    * デッキ
    */
// プレイヤー1
  final List<EmperorCard> player1Deck;
  @JsonKey(defaultValue: const [
    const EmperorCard(cardType: CardType.citizen),
    const EmperorCard(cardType: CardType.citizen),
    const EmperorCard(cardType: CardType.citizen),
    const EmperorCard(cardType: CardType.citizen),
    const EmperorCard(cardType: CardType.slave)
  ])
  @override // プレイヤー2
  final List<EmperorCard> player2Deck;
  @override
  /*
    * 選択したカード
    */
  final int? cardChosenByPlayer1;
  @override
  final int? cardChosenByPlayer2;
  @JsonKey(defaultValue: 0)
  @override
  /*
     * ターン
     */
  final int turn;
  @JsonKey(defaultValue: 0)
  @override
  /*
     * フェイズ
     */
  final int phase;
  @JsonKey(defaultValue: 0)
  @override
  /*
     * 勝利フラグ
     * 1 -> プレイヤー1の勝利
     * 2 -> プレイヤー2の勝利
     */
  final int winFlag;
  @JsonKey(defaultValue: true)
  @override
  final bool isHandfulVisible;
  @JsonKey(defaultValue: false)
  @override
  final bool isCardFront;

  @override
  String toString() {
    return 'ECard(player1Deck: $player1Deck, player2Deck: $player2Deck, cardChosenByPlayer1: $cardChosenByPlayer1, cardChosenByPlayer2: $cardChosenByPlayer2, turn: $turn, phase: $phase, winFlag: $winFlag, isHandfulVisible: $isHandfulVisible, isCardFront: $isCardFront)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ECard &&
            (identical(other.player1Deck, player1Deck) ||
                const DeepCollectionEquality()
                    .equals(other.player1Deck, player1Deck)) &&
            (identical(other.player2Deck, player2Deck) ||
                const DeepCollectionEquality()
                    .equals(other.player2Deck, player2Deck)) &&
            (identical(other.cardChosenByPlayer1, cardChosenByPlayer1) ||
                const DeepCollectionEquality()
                    .equals(other.cardChosenByPlayer1, cardChosenByPlayer1)) &&
            (identical(other.cardChosenByPlayer2, cardChosenByPlayer2) ||
                const DeepCollectionEquality()
                    .equals(other.cardChosenByPlayer2, cardChosenByPlayer2)) &&
            (identical(other.turn, turn) ||
                const DeepCollectionEquality().equals(other.turn, turn)) &&
            (identical(other.phase, phase) ||
                const DeepCollectionEquality().equals(other.phase, phase)) &&
            (identical(other.winFlag, winFlag) ||
                const DeepCollectionEquality()
                    .equals(other.winFlag, winFlag)) &&
            (identical(other.isHandfulVisible, isHandfulVisible) ||
                const DeepCollectionEquality()
                    .equals(other.isHandfulVisible, isHandfulVisible)) &&
            (identical(other.isCardFront, isCardFront) ||
                const DeepCollectionEquality()
                    .equals(other.isCardFront, isCardFront)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(player1Deck) ^
      const DeepCollectionEquality().hash(player2Deck) ^
      const DeepCollectionEquality().hash(cardChosenByPlayer1) ^
      const DeepCollectionEquality().hash(cardChosenByPlayer2) ^
      const DeepCollectionEquality().hash(turn) ^
      const DeepCollectionEquality().hash(phase) ^
      const DeepCollectionEquality().hash(winFlag) ^
      const DeepCollectionEquality().hash(isHandfulVisible) ^
      const DeepCollectionEquality().hash(isCardFront);

  @JsonKey(ignore: true)
  @override
  _$ECardCopyWith<_ECard> get copyWith =>
      __$ECardCopyWithImpl<_ECard>(this, _$identity);
}

abstract class _ECard extends ECard {
  const factory _ECard(
      {List<EmperorCard> player1Deck,
      List<EmperorCard> player2Deck,
      int? cardChosenByPlayer1,
      int? cardChosenByPlayer2,
      int turn,
      int phase,
      int winFlag,
      bool isHandfulVisible,
      bool isCardFront}) = _$_ECard;
  const _ECard._() : super._();

  @override
  /*
    * デッキ
    */
// プレイヤー1
  List<EmperorCard> get player1Deck => throw _privateConstructorUsedError;
  @override // プレイヤー2
  List<EmperorCard> get player2Deck => throw _privateConstructorUsedError;
  @override
  /*
    * 選択したカード
    */
  int? get cardChosenByPlayer1 => throw _privateConstructorUsedError;
  @override
  int? get cardChosenByPlayer2 => throw _privateConstructorUsedError;
  @override
  /*
     * ターン
     */
  int get turn => throw _privateConstructorUsedError;
  @override
  /*
     * フェイズ
     */
  int get phase => throw _privateConstructorUsedError;
  @override
  /*
     * 勝利フラグ
     * 1 -> プレイヤー1の勝利
     * 2 -> プレイヤー2の勝利
     */
  int get winFlag => throw _privateConstructorUsedError;
  @override
  bool get isHandfulVisible => throw _privateConstructorUsedError;
  @override
  bool get isCardFront => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ECardCopyWith<_ECard> get copyWith => throw _privateConstructorUsedError;
}
