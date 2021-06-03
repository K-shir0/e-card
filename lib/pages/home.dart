import 'package:e_card/providers/ecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final eCardProvider = StateNotifierProvider<ECardNotifier, ECard>(
  (refs) => ECardNotifier(),
);

class HomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final provider = useProvider(eCardProvider);

    final playerDeck =
        [provider.player1Deck, provider.player2Deck].toList()[provider.phase];

    return Scaffold(
        body: Container(
      child: Stack(
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
                      ElevatedButton(
                          onPressed: () {
                            context
                                .read(eCardProvider.notifier)
                                .setPlayerCard(provider.phase + 1, i);
                          },
                          child: Text(
                              playerDeck[i].cardType.toString().split('.')[1]))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
