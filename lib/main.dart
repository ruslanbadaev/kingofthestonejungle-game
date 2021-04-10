import 'package:flutter/material.dart';
import 'package:kingofthestonejungle/notifiers/player_notifier.dart';
import 'package:kingofthestonejungle/notifiers/enemy_notifier.dart';
import 'package:kingofthestonejungle/notifiers/fight_notifier.dart';
import 'package:kingofthestonejungle/screens/menu_screen.dart';
import 'package:kingofthestonejungle/screens/result_screen.dart';
import 'package:kingofthestonejungle/screens/single_fight_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => PlayerNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => EnemyNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => FightNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'King of the Stone Jungle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MenuScreen(title: 'King of the Stone Jungle'),
      routes: {
        "/menu": (context) => MenuScreen(),
        "/single_fight": (context) => SingleFightScreen(),
        "/result": (context) => ResultScreen(),
      },
    );
  }
}
