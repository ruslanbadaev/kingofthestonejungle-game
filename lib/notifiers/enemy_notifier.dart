import 'package:flutter/material.dart';
import 'package:kingofthestonejungle/models/enemy.dart';

class EnemyNotifier with ChangeNotifier {
  Enemy _enemy = Enemy();

  loadEnemy() {
    _enemy.health = 100;
    _enemy.isRandom = false;
    print(_enemy.health);
  }

  loadRandomEnemy() {
    _enemy.health = 100;
    _enemy.isRandom = true;
    print(_enemy.health);
  }

  void getDamage(int damage) {
    print(_enemy.health);
    _enemy.health = _enemy.health - damage;
    notifyListeners();
  }

  int getHealph() {
    return _enemy.health;
  }

  Enemy getEnemy() {
    return _enemy;
  }
}
