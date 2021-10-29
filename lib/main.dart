import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  String mode = modePiano;
  static const String modePiano = 'piano';
  static String modeDrums = 'drums';
  static String modeDog = 'dog';
  static String modeSilly = 'silly';

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

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
