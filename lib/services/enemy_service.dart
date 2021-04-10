import 'dart:convert';
import 'package:kingofthestonejungle/notifiers/enemy_notifier.dart';
import 'package:http/http.dart' as http;

class EnemyService {
  static getEnemyData(EnemyNotifier enemyNotifier, bool isRandom) async {
    if (isRandom) {
      enemyNotifier.loadRandomEnemy();
    } else {
      enemyNotifier.loadEnemy();
    }
  }
}
