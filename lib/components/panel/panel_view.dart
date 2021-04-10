import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kingofthestonejungle/components/panel/panel_view_model.dart';
import 'package:kingofthestonejungle/models/panel.dart';
import 'package:kingofthestonejungle/notifiers/fight_notifier.dart';

class PanelView extends StatefulWidget {
  final Panel panel;

  PanelView({@required this.panel});

  @override
  State createState() {
    return PanelViewState(panel);
  }
}

class PanelViewState extends State<PanelView> {
  Panel panel;
  PanelViewModel panelViewModel;

  PanelViewState(this.panel) {
    panelViewModel = new PanelViewModel();
    panelViewModel.setPanel(panel);
  }

  @override
  Widget build(BuildContext context) {
    FightNotifier fightNotifier = Provider.of<FightNotifier>(context);
    return Container(
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.fingerprint_rounded),
              onPressed: () => fightNotifier.setKick(1)),
          IconButton(
              icon: Icon(Icons.fingerprint_rounded),
              onPressed: () => fightNotifier.setKick(2)),
          IconButton(
              icon: Icon(Icons.fingerprint_rounded),
              onPressed: () => fightNotifier.setKick(3)),
        ],
      ),
    );
  }
}
