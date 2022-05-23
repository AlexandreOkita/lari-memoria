import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lari_memoria/audio/audio_controller.dart';
import 'package:lari_memoria/game/model/card_model.dart';

class BandInfo extends ConsumerWidget {
  final CardModel card;

  BandInfo({required this.card, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screen = MediaQuery.of(context).size;
    ref.read(audioControllerProvider).play(card.audioPath);
    return Center(
      child: Container(
        height: screen.height * 0.7,
        width: screen.width * 0.7,
        color: Colors.white,
        child: card.modalImage,
      ),
    );
  }
}
