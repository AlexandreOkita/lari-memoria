import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lari_memoria/game/components/card.dart';
import 'package:lari_memoria/game/model/card_model.dart';
import 'package:lari_memoria/game/providers/game_provider.dart';

class GameView extends ConsumerWidget {
  GameView({Key? key}) : super(key: key);
  final card1 = CardModel(
      bandName: "a",
      image: Colors.orange,
      modalImage: Image.asset('assets/images/dratini.png'),
      audioPath: 'assets/audio/Immortal - NEFFEX.mp3');
  final card2 = CardModel(
      bandName: "b",
      image: Colors.blue,
      modalImage: Image.asset("assets/images/grimer.jpeg"),
      audioPath: 'assets/audio/Immortal - NEFFEX.mp3');
  final card3 = CardModel(
      bandName: "c",
      image: Colors.green,
      modalImage: Image.asset("assets/images/gyrados.png"),
      audioPath: 'assets/audio/Immortal - NEFFEX.mp3');
  final card4 = CardModel(
      bandName: "d",
      image: Colors.brown,
      modalImage: Image.asset("assets/images/rotom.png"),
      audioPath: 'assets/audio/Immortal - NEFFEX.mp3');
  final card5 = CardModel(
      bandName: "e",
      image: Colors.purple,
      modalImage: Image.asset("assets/images/seal.png"),
      audioPath: 'assets/audio/Immortal - NEFFEX.mp3');
  final card6 = CardModel(
      bandName: "f",
      image: Colors.red,
      modalImage: Image.asset("assets/images/unown.jpeg"),
      audioPath: 'assets/audio/Immortal - NEFFEX.mp3');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.1,
              vertical: screenSize.height * 0.2,
            ),
            child: Center(
              child: Table(
                defaultColumnWidth: FixedColumnWidth(150),
                children: [
                  TableRow(children: [
                    GameCard(card: card1),
                    GameCard(card: card3),
                    GameCard(card: card2),
                    GameCard(card: card6)
                  ]),
                  TableRow(children: [
                    GameCard(card: card2),
                    GameCard(card: card5),
                    GameCard(card: card6),
                    GameCard(card: card4)
                  ]),
                  TableRow(children: [
                    GameCard(card: card5),
                    GameCard(card: card4),
                    GameCard(card: card1),
                    GameCard(card: card3)
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
