import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'card.dart';

part 'ecard.freezed.dart';

@freezed
class ECard with _$ECard {
  const ECard._();

  const factory ECard({
    /*
    * デッキ
    */
    // プレイヤー1
    @Default([
      Card(cardType: CardType.citizen),
      Card(cardType: CardType.citizen),
      Card(cardType: CardType.citizen),
      Card(cardType: CardType.citizen),
      Card(cardType: CardType.emperor)
    ])
        List<Card> player1Deck,
    // プレイヤー2
    @Default([
      Card(cardType: CardType.citizen),
      Card(cardType: CardType.citizen),
      Card(cardType: CardType.citizen),
      Card(cardType: CardType.citizen),
      Card(cardType: CardType.slave)
    ])
        List<Card> player2Deck,

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
  }) = _ECard;

  /*
   * 最大ターン
   */
  final _MAXTURN = 5;
}

class ECardNotifier extends StateNotifier<ECard> {
  ECardNotifier() : super(const ECard());

  void setPlayerCard(int player, int number) {
    final _MAXTURN = state._MAXTURN;
    final turn = state.turn;

    // ターン数より選択したカード番号が多ければエラー
    if (number > _MAXTURN - turn) return;

    if (player == 1) {
      state =
          state.copyWith(phase: state.phase + 1, cardChosenByPlayer1: number);
    }

    if (player == 2) {
      state =
          state.copyWith(phase: state.phase + 1, cardChosenByPlayer2: number);
    }

    if (state.phase == 2) {
      print("バトル");
      battle();

      state = state.copyWith(phase: 0, turn: state.turn + 1);
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

    // 選択したカードを削除
    player1Deck.removeAt(cardChosenByPlayer1);
    player2Deck.removeAt(cardChosenByPlayer2);
    state = state.copyWith(player1Deck: player1Deck, player2Deck: player2Deck);

    switch (card1.compare(card2)) {
      case -1:
        winFlag = 2;
        break;
      case 0:
        break;
      case 1:
        print("1pWin");
        winFlag = 1;
        break;
    }

    // 選んだカードを初期化＆winFlagを反映
    state = state.copyWith(
      winFlag: winFlag,
      cardChosenByPlayer1: null,
      cardChosenByPlayer2: null,
    );
  }
}
