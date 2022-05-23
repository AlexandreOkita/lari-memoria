import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lari_memoria/game/view/game_view.dart';
import 'package:lari_memoria/main_menu/menu_page.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memorias da Lari',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const MenuPage(),
        '/game': (context) => GameView(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return PageRouteBuilder(pageBuilder: (_, __, ___) => const MenuPage());
        }
        return null;
      },
      initialRoute: '/',
    );
  }
}
