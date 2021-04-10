import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:math';
import 'package:kingofthestonejungle/notifiers/enemy_notifier.dart';
import 'package:kingofthestonejungle/notifiers/player_notifier.dart';
import 'package:kingofthestonejungle/models/panel.dart';

class FightNotifier with ChangeNotifier {
  Panel _panel = Panel();

  loadPanel() {
    _panel.kick = 0;
    _panel.enemyKick = 0;
    _panel.hidden = true;
    //notifyListeners();
  }

  void getDamage(int damage) {
    notifyListeners();
  }

  void showPanel(context, PlayerNotifier playerNotifier,
      EnemyNotifier enemyNotifier) async {
    _panel.hidden = false;
    notifyListeners();
    Timer timer = new Timer(new Duration(seconds: 3), () async {
      debugPrint("бой...");
      _panel.hidden = true;
      Random random = new Random();

      _panel.enemyKick = enemyNotifier.getEnemy().isRandom
          ? random.nextInt(2) + 1
          : multiplayerFunction;
      String fightResult = fight(_panel.kick, _panel.enemyKick);
      if (fightResult == 'deadHeat')
        deadHeat(playerNotifier, enemyNotifier);
      else if (fightResult == 'victory')
        victory(playerNotifier, enemyNotifier);
      else if (fightResult == 'defeat') defeat(playerNotifier, enemyNotifier);
      _panel.kick = 0;
      if (playerNotifier.getHealph() <= 0)
        Navigator.pushNamed(context, "/result");
      else if (enemyNotifier.getHealph() <= 0)
        Navigator.pushNamed(context, "/result");
      notifyListeners();
    });
  }

  void setKick(int kick) {
    _panel.kick = kick;
    notifyListeners();
  }

  String fight(playerKick, enemyKick) {
    print('$playerKick vs $enemyKick');
    // 1 - камень
    // 2 - ножницы
    // 3 - бумага
    if ((playerKick == 0 && enemyKick == 0) ||
        (playerKick == 1 && enemyKick == 1) ||
        (playerKick == 2 && enemyKick == 2) ||
        (playerKick == 3 && enemyKick == 3))
      return 'deadHeat';
    else if ((enemyKick == 0) ||
        (playerKick == 1 && enemyKick == 2) ||
        (playerKick == 2 && enemyKick == 3) ||
        (playerKick == 3 && enemyKick == 1))
      return 'victory';
    else
      return 'defeat';
  }

  int multiplayerFunction() {
    return 0;
  }

  void victory(PlayerNotifier playerNotifier, EnemyNotifier enemyNotifier) {
    enemyNotifier.getDamage(25);
    print('Победа');
  }

  void defeat(PlayerNotifier playerNotifier, EnemyNotifier enemyNotifier) {
    playerNotifier.getDamage(25);
    print('Поражение');
  }

  void deadHeat(PlayerNotifier playerNotifier, EnemyNotifier enemyNotifier) {
    print('Ничья');
  }

  Panel getPanel() {
    return _panel;
  }
}
