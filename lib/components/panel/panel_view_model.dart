import 'package:kingofthestonejungle/models/panel.dart';

class PanelViewModel {
  Panel _panel;

  setPanel(Panel panel) {
    _panel = panel;
  }

  Panel get panel => _panel;
}
