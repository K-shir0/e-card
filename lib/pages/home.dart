import 'package:e_card/providers/card.dart';
import 'package:e_card/providers/ecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookWidget {
  final eCardProvider = StateNotifierProvider<ECardNotifier, ECard>(
    (refs) => ECardNotifier(),
  );

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(eCardProvider);

    final playerDeck =
        [provider.player1Deck, provider.player2Deck].toList()[provider.phase];

    return Scaffold(
        body: Stack(
      children: [
        Column(
          children: [
            const Text(' '),
            const Text(' '),
            Text('turn: ${provider.turn}'),
            Text('phase: ${provider.phase}'),
            Text('cardChosenByPlayer1: ${provider.cardChosenByPlayer1}'),
            Text('cardChosenByPlayer2: ${provider.cardChosenByPlayer2}'),
            Text('winFlag: ${provider.winFlag}'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  for (int i = 0; i < playerDeck.length; i++)
                    ECardWidget(cardType: playerDeck[i].cardType),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     context
                  //         .read(eCardProvider.notifier)
                  //         .setPlayerCard(provider.phase + 1, i);
                  //   },
                  //   child:
                  //       Text(playerDeck[i].cardType.toString().split('.')[1]),
                  // )
                ],
              )
            ],
          ),
        ),
      ],
    ));
  }
}

class ECardWidget extends StatelessWidget {
  final CardType cardType;

  const ECardWidget({required this.cardType});

  // 73e5e5
  // e5e573

  @override
  Widget build(BuildContext context) {
    String text = "";
    Color color = Colors.white;

    switch (cardType) {
      // 奴隷
      case CardType.slave:
        text = "奴隷";
        color = const Color(0xffe57373);
        break;
      case CardType.citizen:
        text = "市民";
        color = const Color(0xff73e5e5);
        break;
      case CardType.emperor:
        text = "皇帝";
        color = const Color(0xffe5e573);
        break;
    }

    return Card(
      child: Container(
        color: color,
        child: Padding(
          padding: const EdgeInsets.only(top: 60, bottom: 60),
          child: Container(
            height: 40,
            width: 100,
            color: Colors.white,
            child: Center(child: Text(text)),
          ),
        ),
      ),
    );
  }
}
