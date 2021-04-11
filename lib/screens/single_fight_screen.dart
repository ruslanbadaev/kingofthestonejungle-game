import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:kingofthestonejungle/components/player/player_view.dart';
import 'package:kingofthestonejungle/components/enemy/enemy_view.dart';
import 'package:kingofthestonejungle/components/panel/panel_view.dart';
import 'package:kingofthestonejungle/notifiers/fight_notifier.dart';
import 'package:kingofthestonejungle/notifiers/player_notifier.dart';
import 'package:kingofthestonejungle/notifiers/enemy_notifier.dart';

import 'package:kingofthestonejungle/services/player_service.dart';
import 'package:kingofthestonejungle/services/enemy_service.dart';
import 'package:kingofthestonejungle/services/panel_service.dart';
import 'package:provider/provider.dart';

import 'package:kingofthestonejungle/models/player.dart';
import 'package:kingofthestonejungle/models/enemy.dart';

class SingleFightScreen extends StatefulWidget {
  SingleFightScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SingleFightScreen> {
  @override
  void initState() {
    PlayerNotifier playerNotifier =
        Provider.of<PlayerNotifier>(context, listen: false);
    PlayerService.getPlayerData(playerNotifier);
    EnemyNotifier enemyNotifier =
        Provider.of<EnemyNotifier>(context, listen: false);
    EnemyService.getEnemyData(enemyNotifier, true);
    FightNotifier fightNotifier =
        Provider.of<FightNotifier>(context, listen: false);
    PanelService.getPanelData(fightNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PlayerNotifier playerNotifier = Provider.of<PlayerNotifier>(context);
    EnemyNotifier enemyNotifier = Provider.of<EnemyNotifier>(context);
    FightNotifier fightNotifier = Provider.of<FightNotifier>(context);

    return Scaffold(
        /*       appBar: AppBar(
          title: Text("King of the Stone Jungle"),
        ), */
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/b2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: new Column(
        children: <Widget>[
          new Expanded(
            flex: 4,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.all(12),
                      height: 85,
                      width: 220,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/h1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Text(
                        '+${playerNotifier.getHealph()}',
                        style: TextStyle(color: Colors.orange),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    if (fightNotifier.getPanel().fight &&
                        fightNotifier.getPanel().kick == 0)
                      PanelView(
                        panel: fightNotifier.getPanel(),
                      )
                    else if (fightNotifier.getPanel().fight &&
                        fightNotifier.getPanel().kick != 0)
                      Container(
                        height: 85,
                        width: 220,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/r1.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(12),
                            child: Text(
                              'There will be a fight animation...',
                              textAlign: TextAlign.center,
                            )),
                      )
                    else if (!fightNotifier.getPanel().fight)
                      Container(
                        /*                 decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/X1.png"),
                            fit: BoxFit.fill,
                          ),
                        ), */
                        child: InkWell(
                            child: Container(
                                height: 128,
                                margin: EdgeInsets.all(12),
                                child: Container(
                                    child: Image.asset(
                                  'assets/images/b1-2.png',
                                  fit: BoxFit.fitHeight,
                                ) /* Text(
                                    '${fightNotifier.getPanel().message}') */
                                    )),
                            onTap: () => (fightNotifier.getPanel().message ==
                                    'Начать бой')
                                ? fightNotifier.showPanel(
                                    context, playerNotifier, enemyNotifier)
                                : null), /* IconButton(
                              onPressed: () => fightNotifier.showPanel(
                                  context, playerNotifier, enemyNotifier),
                              icon: Icon(Icons.star_outline_rounded),
                            ), */
                      ),
                    Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.rotationY(math.pi),
                        child: Container(
                          margin: EdgeInsets.all(12),
                          height: 85,
                          width: 220,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/h1.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.rotationY(math.pi),
                              child: Text(
                                '+${enemyNotifier.getHealph()}',
                                style: TextStyle(color: Colors.orange),
                                textAlign: TextAlign.center,
                              )),
                        )),
                  ],
                )
              ],
            ),
          ),
          new Expanded(
            flex: 8,
            child: Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                    height: 250,
                    width: 250,
                    child: InkWell(
                      //onTap: () => {playerNotifier.getDamage(10)},
                      child: PlayerView(
                        player: playerNotifier.getPlayer(),
                      ),
                    )),
                Container(
                    //color: Colors.red,
                    height: 250,
                    width: 250,
                    /*        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/f4.png"),
                            fit: BoxFit.cover,
                          ),
                        ), */
                    child: InkWell(
                      //onTap: () => {enemyNotifier.getDamage(10)},
                      child: EnemyView(
                        enemy: enemyNotifier.getEnemy(),
                      ),
                    ))
              ],
            )),
          ),
          new Expanded(
              flex: 1,
              child: Container(
                color: Colors.brown[800],
              )),
        ],
      ),
    ));
  }
}
