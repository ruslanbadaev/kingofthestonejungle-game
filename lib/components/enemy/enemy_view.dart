import 'dart:math' as math;
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
    return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(math.pi),
        child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/f41.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: InkWell(
                    child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'enemy',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                )))));
  }
}
