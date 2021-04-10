import 'package:kingofthestonejungle/models/player.dart';

class PlayerViewModel {
  Player _player;

  setPlayer(Player player) {
    _player = player;
  }

  Player get player => _player;
}
