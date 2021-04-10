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
        appBar: AppBar(
          title: Text("King of the Stone Jungle"),
        ),
        body: Container(
          child: new Column(
            children: <Widget>[
              new Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text('XP ${playerNotifier.getHealph()}'),
                        ),
                        if (!fightNotifier.getPanel().hidden &&
                            fightNotifier.getPanel().kick == 0)
                          PanelView(
                            panel: fightNotifier.getPanel(),
                          )
                        else if ((!fightNotifier.getPanel().hidden &&
                            fightNotifier.getPanel().kick != 0))
                          Container(
                            child: Text('${fightNotifier.getPanel().kick}'),
                          )
                        else
                          Container(
                            child: InkWell(
                                child: Container(
                                    child: Text(
                                        '${fightNotifier.getPanel().message}')),
                                onTap: () => (fightNotifier
                                            .getPanel()
                                            .message ==
                                        'Начать бой')
                                    ? fightNotifier.showPanel(
                                        context, playerNotifier, enemyNotifier)
                                    : null), /* IconButton(
                              onPressed: () => fightNotifier.showPanel(
                                  context, playerNotifier, enemyNotifier),
                              icon: Icon(Icons.star_outline_rounded),
                            ), */
                          ),
                        Container(
                          child: Text('XP ${enemyNotifier.getHealph()}'),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              new Expanded(
                flex: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                        color: Colors.red,
                        height: 150,
                        width: 150,
                        child: InkWell(
                          onTap: () => {playerNotifier.getDamage(10)},
                          child: PlayerView(
                            player: playerNotifier.getPlayer(),
                          ),
                        )),
                    Container(
                        color: Colors.red,
                        height: 150,
                        width: 150,
                        child: InkWell(
                          onTap: () => {enemyNotifier.getDamage(10)},
                          child: EnemyView(
                            enemy: enemyNotifier.getEnemy(),
                          ),
                        ))
                  ],
                ),
              ),
              new Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                  )),
            ],
          ),
        ));
  }
}
