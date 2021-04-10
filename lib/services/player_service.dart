import 'dart:convert';
import 'package:kingofthestonejungle/notifiers/player_notifier.dart';
import 'package:http/http.dart' as http;

class PlayerService {
  static getPlayerData(PlayerNotifier playerNotifier) async {
    playerNotifier.loadPlayer();
  }
}
