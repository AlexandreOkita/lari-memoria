import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lari_memoria/audio/audio_controller.dart';
import 'package:lari_memoria/game/view/game_view.dart';

class MenuPage extends ConsumerWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          const Spacer(),
          const Text(
            "Minhas Memórias Musicais",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
          ),
          const Spacer(),
          InkWell(
              child: const Text("Começar"),
              onTap: () {
                ref.read(audioControllerProvider).play("assets/audio/Campfire - Telecasted.mp3");
                Navigator.push(context, MaterialPageRoute(builder: ((context) => GameView())));
              }),
          const Spacer(),
        ]),
      ),
    );
  }
}
