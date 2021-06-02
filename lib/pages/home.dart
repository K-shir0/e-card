import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum CardType {
  slave, // 奴隷
  citizen, // 市民
  emperor // 皇帝
}

class Card {
  final CardType cardType;

  Card({required this.cardType});

  int compare(Card card) {
    switch (cardType) {
      // 奴隷 vs
      case CardType.slave:
        // 皇帝
        if (card.cardType == CardType.emperor) return 1;
        // それ以外
        return -1;

      // 市民 vs
      case CardType.citizen:
        // 皇帝
        if (card.cardType == CardType.emperor) return -1;
        // 奴隷
        if (card.cardType == CardType.slave) return 1;
        // 市民
        return 0;

      // 皇帝 vs
      case CardType.emperor:
        // 奴隷
        if (card.cardType == CardType.slave) return -1;
        // その他
        return 1;
    }
  }
}

class Player {}

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

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useState(ECard());

    final displayCards = useState(state.value.player1Deck);

    switch (state.value.phase) {
      // プレイヤー1がカードを選択する
      case 0:

    }

    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          Column(
            children: [
              const Text(' '),
              const Text(' '),
              Text('Turn: ${state.value.turn}'),
              Text('Phase: ${state.value.phase}'),
              Text('cardChosenByPlayer1: ${state.value.cardChosenByPlayer1}'),
              Text('cardChosenByPlayer2: ${state.value.cardChosenByPlayer2}'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  for (int i=0; i < displayCards.value.length; i++)
                    ElevatedButton(
                        onPressed: () {
                          state.value.setPlayerCard(1, i);
                        },
                        child: Text(displayCards.value[i].cardType.toString().split('.')[1]))
                ],
              )
            ],
          ),
        ],
      ),
    ));
  }
}
