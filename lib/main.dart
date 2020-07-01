import 'package:flutter/material.dart';
import 'package:sembast_tutorial/home_page.dart';
import 'package:sembast_tutorial/init.dart';

void main() => runApp(CakeApp());

class CakeApp extends StatefulWidget {
  @override
  _CakeAppState createState() => _CakeAppState();
}

class _CakeAppState extends State<CakeApp> {
  final Future _init =  Init.initialize();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Favorite Cakes',
      home: FutureBuilder(
        future: _init,
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.done){
            return HomePage();
          } else {
            return Material(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}

