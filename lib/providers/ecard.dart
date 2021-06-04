import 'package:e_card/pages/home.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'card.dart';

part 'ecard.freezed.dart';

@freezed
class ECard with _$ECard {
  const factory ECard({
    /*
    * デッキ
    */
    // プレイヤー1
    @Default([
      EmperorCard(cardType: CardType.citizen),
      EmperorCard(cardType: CardType.citizen),
      EmperorCard(cardType: CardType.citizen),
      EmperorCard(cardType: CardType.citizen),
      EmperorCard(cardType: CardType.emperor)
    ])
        List<EmperorCard> player1Deck,
    // プレイヤー2
    @Default([
      EmperorCard(cardType: CardType.citizen),
      EmperorCard(cardType: CardType.citizen),
      EmperorCard(cardType: CardType.citizen),
      EmperorCard(cardType: CardType.citizen),
      EmperorCard(cardType: CardType.slave)
    ])
        List<EmperorCard> player2Deck,

    /*
    * 選択したカード
    */
    int? cardChosenByPlayer1,
    int? cardChosenByPlayer2,

    /*
     * ターン
     */
    @Default(0)
        int turn,

    /*
     * フェイズ
     */
    @Default(0)
        int phase,

    /*
     * 勝利フラグ
     * 1 -> プレイヤー1の勝利
     * 2 -> プレイヤー2の勝利
     */
    @Default(0)
        int winFlag,

    // 手札を表示するか
    @Default(true)
        bool isHandfulVisible,

    // カードを表にするか
    @Default(false)
        bool isCardFront,
    @Default(GameMode.normal)
        GameMode mode,
  }) = _ECard;

  const ECard._(); // 名前無しコンストラクタ

  /*
   * 最大ターン
   */
  // ignore: avoid_field_initializers_in_const_classes
  final maxTurn = 5;
}

class ECardNotifier extends StateNotifier<ECard> {
  ECardNotifier() : super(const ECard());

  /*
   * カードを選択した後フェイズを進める
   */
  void setPlayerCard(int player, int number) {
    final maxTurn = state.maxTurn;
    final turn = state.turn;

    // ターン数より選択したカード番号が多ければエラー
    if (number > maxTurn - turn) return;

    if (player == 1) {
      state = state.copyWith(cardChosenByPlayer1: number);
    }

    if (player == 2) {
      state = state.copyWith(cardChosenByPlayer2: number);
    }

    if (state.phase == 2) {
      battle();
    }

    // 次のフェイズへ
    nextPhase();
  }

  void nextPhase() {
    /*
     * フェイズ0
     * プレイヤー1がカードを選択する
     *
     * フェイズ1
     * プレイヤー2がカードを選択する
     *
     * フェイズ2
     * 裏面のカードが二つ並んでいる状態
     *
     * フェイズ3 対戦フェイズ
     * カードを表にして対戦するフェイズ
     *
     * フェイズ4 WinCheckフェイズ何もなければ次のターンへ
     *
     */
    state = state.copyWith(phase: state.phase + 1);

    if (state.phase == 2) {
      state = state.copyWith(isHandfulVisible: false);
    }

    if (state.phase == 3) {
      state = state.copyWith(isCardFront: true);
      battle();
    }

    if (state.phase == 4) {
      if (state.winFlag != 0) return;

      // カードを消す
      final cardChosenByPlayer1 = state.cardChosenByPlayer1;
      final cardChosenByPlayer2 = state.cardChosenByPlayer2;

      final player1Deck = [...state.player1Deck];
      final player2Deck = [...state.player2Deck];

      // 選択カードのチェック
      if (cardChosenByPlayer1 == null || cardChosenByPlayer2 == null) return;

      // 選択したカードを使用済みとして削除
      player1Deck.removeAt(cardChosenByPlayer1);
      player2Deck.removeAt(cardChosenByPlayer2);

      state = state.copyWith(
        // フェイズの初期化
        phase: 0,
        // 選択カードの初期化
        cardChosenByPlayer1: null,
        cardChosenByPlayer2: null,
        // デッキの反映
        player1Deck: player1Deck,
        player2Deck: player2Deck,
        // ターンの追加
        turn: state.turn + 1,
        isHandfulVisible: true,
        isCardFront: false,
      );
    }
  }

  void battle() {
    final cardChosenByPlayer1 = state.cardChosenByPlayer1;
    final cardChosenByPlayer2 = state.cardChosenByPlayer2;

    final player1Deck = [...state.player1Deck];
    final player2Deck = [...state.player2Deck];

    int winFlag = state.winFlag;

    // 選択したカードがNULLでないか
    if (cardChosenByPlayer1 == null || cardChosenByPlayer2 == null) {
      return;
    }

    // カードを取得
    final card1 = player1Deck[cardChosenByPlayer1];
    final card2 = player2Deck[cardChosenByPlayer2];

    // 勝利条件を分岐
    // 1  -> 勝ち
    // 0  -> 引き分け
    // -1 -> 負け
    switch (card1.compare(card2)) {
      case -1:
        winFlag = 2;
        break;
      case 0:
        break;
      case 1:
        winFlag = 1;
        break;
    }

    // 選んだカードを初期化＆winFlagを反映
    state = state.copyWith(
      winFlag: winFlag,
    );
  }

  void setGameMode(GameMode mode) {
    state = state.copyWith(mode: mode);
  }
}
