import 'package:flutter/material.dart';
import 'package:kingofthestonejungle/components/player/player_view_model.dart';
import 'package:kingofthestonejungle/models/player.dart';
import 'package:kingofthestonejungle/notifiers/player_notifier.dart';

class PlayerView extends StatefulWidget {
  final Player player;

  PlayerView({@required this.player});

  @override
  State createState() {
    return PlayerViewState(player);
  }
}

class PlayerViewState extends State<PlayerView> {
  Player player;
  PlayerViewModel playerViewModel;

  PlayerViewState(this.player) {
    playerViewModel = new PlayerViewModel();
    playerViewModel.setPlayer(player);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 250,
        width: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/f12.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: InkWell(
            child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            'you',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green),
          ),
        )));
  }
}
