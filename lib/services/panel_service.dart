import 'dart:convert';
import 'package:kingofthestonejungle/notifiers/panel_notifier.dart';
import 'package:http/http.dart' as http;

class PanelService {
  static getPanelData(PanelNotifier panelNotifier) async {
    panelNotifier.loadPanel();
  }
}
