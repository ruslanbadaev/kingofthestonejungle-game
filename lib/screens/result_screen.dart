import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ResultScreen extends StatefulWidget {
  ResultScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ResultScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("King of the Stone Jungle"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 150,
                width: 150,
                color: Colors.red,
              ),
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                RaisedButton(
                    onPressed: () => Navigator.pushNamed(context, "/menu"),
                    child: Text('В меню')),
              ])
            ],
          ),
        ));
  }
}
