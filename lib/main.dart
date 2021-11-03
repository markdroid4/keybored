import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keybored',
      home: const MyHomePage(title: 'Keybored'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String mode = modePiano;
  static const String modePiano = 'piano';
  static String modeDrums = 'drums';
  static String modeDog = 'dog';
  static String modeSilly = 'silly';

  @override
  Widget build(BuildContext context) {
    void playSound(int num) {
      final player = AudioCache();
      player.play('$num.mp3');
    }

    Widget buildKey(int num, Color c) {
      return Expanded(
        child: TextButton(
          child: Container(color: c),
          onPressed: () {
            playSound(num);
          },
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            buildKey(1, Colors.lightGreen),
            buildKey(2, Colors.blue),
            buildKey(3, Colors.teal),
            buildKey(4, Colors.cyanAccent),
            buildKey(5, Colors.purple),
            buildKey(6, Colors.yellowAccent),
            buildKey(7, Colors.indigoAccent),
            buildKey(8, Colors.red),
          ],
        ),
      ),
    );
  }
}
