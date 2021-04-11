import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MenuScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
/*         appBar: AppBar(
          title: Text("King of the Stone Jungle"),
        ), */
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/b5.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 280,
                    width: 280,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/r1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      height: 230,
                      width: 230,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/a11.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          child: Container(
                            child: Image.asset('assets/images/bs1.png'),
                          ),
                          onTap: () =>
                              Navigator.pushNamed(context, "/single_fight"),
                        ),
                        InkWell(
                          child: Container(
                            child: Image.asset('assets/images/b3.png'),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            child: Image.asset('assets/images/b4.png'),
                          ),
                        ),
                      ])
                ],
              ),
            )));
  }
}
