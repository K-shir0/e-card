import 'package:e_card/providers/card.dart';

class ECard {
  /*
   * デッキ
   */
  final player1Deck = <Card>[
    Card(cardType: CardType.citizen),
    Card(cardType: CardType.citizen),
    Card(cardType: CardType.citizen),
    Card(cardType: CardType.citizen),
    Card(cardType: CardType.emperor)
  ];

  final player2Deck = <Card>[
    Card(cardType: CardType.citizen),
    Card(cardType: CardType.citizen),
    Card(cardType: CardType.citizen),
    Card(cardType: CardType.citizen),
    Card(cardType: CardType.slave)
  ];

  /*
   * 選択したカード
   */
  int? cardChosenByPlayer1;
  int? cardChosenByPlayer2;

  /*
   * ターン
   */
  final _MAXTURN = 5;
  int turn = 0;

  /*
   * フェイズ
   */
  int phase = 0;

  void setPlayerCard(int player, int number) {
    // ターン数より選択したカード番号が多ければエラー
    if (number > _MAXTURN - turn) return;

    if (player == 1) {
      cardChosenByPlayer1 = number;
    }

    if (player == 2) {
      cardChosenByPlayer2 = number;
    }
  }

  /*
   * 勝利フラグ
   */
  int winFlag = 0;

  void battle() {
    if (cardChosenByPlayer1 == null || cardChosenByPlayer2 == null) {
      return;
    }
    final card1 = player1Deck[cardChosenByPlayer1!];
    final card2 = player1Deck[cardChosenByPlayer2!];

    // 選択したカードを削除
    player1Deck.removeAt(cardChosenByPlayer1!);
    player2Deck.removeAt(cardChosenByPlayer2!);

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

    // 選んだカードを初期化
    cardChosenByPlayer1 = null;
    cardChosenByPlayer2 = null;
  }
}