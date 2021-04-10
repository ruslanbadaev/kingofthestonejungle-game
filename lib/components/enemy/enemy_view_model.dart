import 'package:kingofthestonejungle/models/enemy.dart';

class EnemyViewModel {
  Enemy _enemy;

  setEnemy(Enemy enemy) {
    _enemy = enemy;
  }

  Enemy get enemy => _enemy;
}
