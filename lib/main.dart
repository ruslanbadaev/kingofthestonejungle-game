import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  SystemChrome.setEnabledSystemUIOverlays([]);
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
    return WillPopScope(
        onWillPop: () => showDialog<bool>(
              context: context,
              builder: (c) => AlertDialog(
                title: Text('Wow'),
                content: Text('Aяe you going to the stall for vodka now?'),
                actions: [
                  FlatButton(
                    child: Text('da bliat'),
                    onPressed: () => SystemNavigator.pop(),
                  ),
                  FlatButton(
                    child: Text('not now'),
                    onPressed: () => Navigator.pop(c, true),
                  ),
                ],
              ),
            ),
        child: MaterialApp(
          title: 'King of the Stone Jungle',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.pressStart2pTextTheme(
              Theme.of(context).textTheme,
            ),
          ),
          home: MenuScreen(title: 'King of the Stone Jungle'),
          routes: {
            "/menu": (context) => MenuScreen(),
            "/single_fight": (context) => SingleFightScreen(),
            "/result": (context) => ResultScreen(),
          },
        ));
  }
}
