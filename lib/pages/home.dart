import 'package:e_card/providers/card.dart';
import 'package:e_card/providers/ecard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum GameMode {
  normal,
  scan,
}

class HomePage extends HookWidget {
  final eCardProvider = StateNotifierProvider<ECardNotifier, ECard>(
        (refs) => ECardNotifier(),
  );

  final MethodChannel _methodChannel = MethodChannel("samples.flutter.dev/nfc");

  Future<String> scanNfcTag() async {
    String _uid = "";

    try {
      // _uid = await _methodChannel.invokeMethod("getNfcTag");
      final uid = await _methodChannel.invokeMethod("getNfcTag");

      return uid.toString();
    } catch (e) {
      print(e);
    }

    return _uid;
  }

  // ゲームモード
  final GameMode mode;

  HomePage({this.mode = GameMode.normal});

  Map<String, CardType> nfcs = {
    "04c6296a6f7180": CardType.citizen,
    "04ba296a6f7180": CardType.citizen,
    "04c2296a6f7180": CardType.citizen,
    "04b6296a6f7180": CardType.citizen,
    "04a1296a6f7180": CardType.citizen,
    "04a9296a6f7180": CardType.citizen,
    "04a5296a6f7180": CardType.citizen,
    "04be296a6f7180": CardType.citizen,
    "04ae296a6f7180": CardType.slave,
    "04b2296a6f7180": CardType.emperor,
  };

  @override
  Widget build(BuildContext context) {
    final provider = useProvider(eCardProvider);

    useEffect(() {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        context.read(eCardProvider.notifier).setGameMode(mode);
      });
    }, []);

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(' '),
                const Text(' '),
                Text('mode: ${mode.toString().split(".")[1]}'),
                Text('turn: ${provider.turn}'),
                Text('phase: ${provider.phase}'),
                Text('cardChosenByPlayer1: ${provider.cardChosenByPlayer1}'),
                Text('cardChosenByPlayer2: ${provider.cardChosenByPlayer2}'),
                Text('winFlag: ${provider.winFlag}'),
                Text('isHandfulVisible: ${provider.isHandfulVisible
                    .toString()}'),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (provider.phase >= 2)
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
                  if (provider.phase >= 1)
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
                    if (mode != GameMode.scan)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < playerDeck.length; i++)
                            Padding(
                              padding: const EdgeInsets.only(left: 8, right: 8),
                              child: Container(
                                transform:
                                Matrix4.translationValues(0.0, 54.0, 0.0),
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
                    else
                      ElevatedButton(
                        onPressed: () {
                          scanNfcTag().then((value) {
                            var findFlag = false;
                            for (int i = 0; i < playerDeck.length && !findFlag; i++) {
                              if (playerDeck[i].cardType == nfcs[value.toString()]) {
                                // 見つけた
                                findFlag = true;
                                print(playerDeck[i].cardType);
                                print("を選択");

                                nfcs.remove(value.toString());

                                context
                                    .read(eCardProvider.notifier)
                                    .setPlayerCard(provider.phase + 1, i);
                              }
                            }
                          });
                        },
                        child: Text("NFC"),
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
              width: 80,
              color: Colors.white.withOpacity(0.8),
              child: Center(child: Text(text)),
            ),
          ),
        ),
      ),
    );
  }
}
