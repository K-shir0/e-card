import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';

enum CardType {
  slave, // 奴隷
  citizen, // 市民
  emperor // 皇帝
}

@freezed
class EmperorCard with _$EmperorCard {
  const factory EmperorCard({
    @Default(CardType.citizen) CardType cardType,
  }) = _EmperorCard;

  const EmperorCard._();

  int compare(EmperorCard card) {
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
