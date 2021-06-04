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

    final playerDeck = [provider.player1Deck, provider.player2Deck]
        .toList()[provider.phase % 2];

    return Scaffold(
        body: Stack(
      children: [
        if (provider.phase >= 2)
          GestureDetector(
            onTap: () {
              context.read(eCardProvider.notifier).nextPhase();
            },
          ),
        Column(
          children: [
            const Text(' '),
            const Text(' '),
            Text('turn: ${provider.turn}'),
            Text('phase: ${provider.phase}'),
            Text('cardChosenByPlayer1: ${provider.cardChosenByPlayer1}'),
            Text('cardChosenByPlayer2: ${provider.cardChosenByPlayer2}'),
            Text('winFlag: ${provider.winFlag}'),
            Text('isHandfulVisible: ${provider.isHandfulVisible.toString()}'),
          ],
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (provider.phase >= 1)
                RotatedBox(
                    quarterTurns: 2,
                    child: ECardWidget(
                        cardType: provider.isCardFront
                            ? provider
                                .player2Deck[provider.cardChosenByPlayer2!]
                                .cardType
                            : null,
                        onTapHandler: () {}))
              else
                Container(),
              // 1Pカード
              if (provider.phase >= 2)
                RotatedBox(
                    quarterTurns: 0,
                    child: ECardWidget(
                        cardType: provider.isCardFront
                            ? provider
                                .player1Deck[provider.cardChosenByPlayer1!]
                                .cardType
                            : null,
                        onTapHandler: () {}))
              else
                Container(),
            ],
          ),
        ),
        if (provider.isHandfulVisible)
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < playerDeck.length; i++)
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Container(
                          transform: Matrix4.translationValues(0.0, 54.0, 0.0),
                          child: ECardWidget(
                            cardType: playerDeck[i].cardType,
                            onTapHandler: () {
                              context
                                  .read(eCardProvider.notifier)
                                  .setPlayerCard(provider.phase + 1, i);
                            },
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ),
        if (provider.winFlag != 0)
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Center(
                child: Text(
              "${provider.winFlag}P 圧倒的 勝利っ・・",
              style: const TextStyle(fontSize: 48),
            )),
          ),
      ],
    ));
  }
}

class ECardWidget extends StatelessWidget {
  final CardType? cardType;
  final Function() onTapHandler;

  const ECardWidget({this.cardType, required this.onTapHandler});

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
      // 市民
      case CardType.citizen:
        text = "市民";
        color = const Color(0xff73e5e5);
        break;
      // 皇帝
      case CardType.emperor:
        text = "皇帝";
        color = const Color(0xffe5e573);
        break;
      // 裏面
      default:
        text = "Eカード";
        color = Colors.black;
    }

    return InkWell(
      onTap: onTapHandler,
      child: Card(
        child: Container(
          color: color,
          child: Padding(
            padding: const EdgeInsets.only(top: 60, bottom: 60),
            child: Container(
              height: 40,
              width: 100,
              color: Colors.white.withOpacity(0.8),
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}
