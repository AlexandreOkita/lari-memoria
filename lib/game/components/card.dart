import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lari_memoria/audio/audio_controller.dart';
import 'package:lari_memoria/game/components/band_info.dart';
import 'package:lari_memoria/game/model/card_model.dart';
import 'package:lari_memoria/game/providers/game_provider.dart';

class GameCard extends ConsumerStatefulWidget {
  final CardModel card;

  const GameCard({required this.card, Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GameCardState();
}

class _GameCardState extends ConsumerState<GameCard> {
  bool isHidden = true;
  bool alreadyCorrect = false;
  Color color = const Color(0xff808080);

  @override
  Widget build(BuildContext context) {
    if (ref.watch(chosenCardsProvider).length == 2 &&
        ref.watch(chosenCardsProvider).every((element) => element == widget.card.bandName)) {
      setState(() {
        alreadyCorrect = true;
      });
    }

    if (ref.watch(willForceFlipProvider) && !alreadyCorrect) {
      setState(() {
        isHidden = true;
        color = const Color(0xff808080);
      });
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: InkWell(
        onHover: (b) => setState(() {
          if (!b && isHidden) {
            color = const Color(0xff808080);
          } else if (b && isHidden && ref.read(isClickableProvider)) {
            color = const Color(0xaa808080);
          }
        }),
        onTap: () {
          if (isHidden && ref.read(isClickableProvider)) {
            color = widget.card.image;
            isHidden = false;
            setState(() {
              ref.read(chosenCardsProvider.notifier).state = [
                ...ref.read(chosenCardsProvider.notifier).state,
                widget.card.bandName
              ];
              final chosenCards = ref.read(chosenCardsProvider);
              if (chosenCards.length == 2) {
                if (chosenCards[0] == chosenCards[1]) {
                  alreadyCorrect = true;
                  showDialog(context: context, builder: (context) => BandInfo(card: widget.card))
                      .then((value) => ref
                          .read(audioControllerProvider)
                          .play("assets/audio/Campfire - Telecasted.mp3"));
                }
                ref.read(isClickableProvider.notifier).state = false;
                Timer(const Duration(seconds: 2), () {
                  ref.read(willForceFlipProvider.notifier).state = true;
                  ref.read(isClickableProvider.notifier).state = true;
                  Timer(const Duration(milliseconds: 20), () {
                    ref.read(willForceFlipProvider.notifier).state = false;
                    ref.read(chosenCardsProvider.notifier).state = [];
                  });
                });
              }
            });
          }
        },
        child: Container(
          color: color,
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
