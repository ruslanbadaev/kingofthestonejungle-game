import 'dart:convert';
import 'package:kingofthestonejungle/notifiers/fight_notifier.dart';
import 'package:http/http.dart' as http;

class PanelService {
  static getPanelData(FightNotifier fightNotifier) async {
    fightNotifier.loadPanel();
  }
}
