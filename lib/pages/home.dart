import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
        if (card.cardType == CardType.emperor)
          return 1;
        // それ以外
        return -1;

      // 市民 vs
      case CardType.citizen:
        // 皇帝
        if (card.cardType == CardType.emperor)
          return -1;
        // 奴隷
        if (card.cardType == CardType.slave)
          return 1;
        // 市民
        return 0;

      // 皇帝 vs
      case CardType.emperor:
        // 奴隷
        if (card.cardType == CardType.slave)
          return -1;
        // その他
        return 1;
    }
  }
}

class HomePage extends HookWidget {
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

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Center(),
    );
  }
}
