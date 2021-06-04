import 'package:e_card/pages/home.dart';
import 'package:e_card/pages/start.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum Page {
  start,
  game,
}

class MyApp extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => StartPage());
        }

        if (settings.name == '/play') {
          return MaterialPageRoute(builder: (context) => HomePage());
        }

        if (settings.name == '/play/scan') {
          return MaterialPageRoute(
              builder: (context) => HomePage(mode: GameMode.scan));
        }

        // Default Routing
        return MaterialPageRoute(builder: (context) => StartPage());
      },
    );
  }
}
