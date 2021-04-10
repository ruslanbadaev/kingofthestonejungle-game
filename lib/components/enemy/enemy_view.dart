import 'package:flutter/material.dart';
import 'package:kingofthestonejungle/components/enemy/enemy_view_model.dart';
import 'package:kingofthestonejungle/models/enemy.dart';
import 'package:kingofthestonejungle/notifiers/enemy_notifier.dart';

class EnemyView extends StatefulWidget {
  final Enemy enemy;

  EnemyView({@required this.enemy});

  @override
  State createState() {
    return EnemyViewState(enemy);
  }
}

class EnemyViewState extends State<EnemyView> {
  Enemy enemy;
  EnemyViewModel enemyViewModel;

  EnemyViewState(this.enemy) {
    enemyViewModel = new EnemyViewModel();
    enemyViewModel.setEnemy(enemy);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Text('enemy ${enemy.health}'),
      ),
    );
  }
}
