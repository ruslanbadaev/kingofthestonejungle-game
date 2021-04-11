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
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;

    if (arguments != null) print(arguments['title']);
    return Scaffold(
/*         appBar: AppBar(
          title: Text(arguments['title']),
        ), */
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/b2.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 350,
                      width: 350,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/r1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(24),
                          child: (arguments != null &&
                                  arguments['title'] == 'victory')
                              ? Text(
                                  'You won this battle. The government lets you piss in the elevator!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.green, fontSize: 24),
                                )
                              : Text(
                                  'You have lost this battle. The government forbids you from rummaging through the trash can!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 24),
                                ))),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                            onPressed: () =>
                                Navigator.pushNamed(context, "/menu"),
                            child: Text('Go home')),
                      ])
                ],
              ),
            )));
  }
}
