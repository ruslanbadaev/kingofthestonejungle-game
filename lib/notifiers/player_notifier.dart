import 'package:flutter/material.dart';
import 'package:kingofthestonejungle/models/player.dart';

class PlayerNotifier with ChangeNotifier {
  Player _player = Player();

  loadPlayer() {
    _player.health = 100;
    print(_player.health);
  }

  void getDamage(int damage) {
    print(_player.health);
    _player.health = _player.health - damage;
    notifyListeners();
  }

  int getHealph() {
    return _player.health;
  }

  Player getPlayer() {
    return _player;
  }
}
