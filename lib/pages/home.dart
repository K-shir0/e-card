import 'package:e_card/providers/card.dart';
import 'package:e_card/providers/ecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

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
