import 'package:flutter/material.dart';
import 'package:viviguamini/widgets/route_generator.dart';
import 'widgets/AppBarrvivicarhue.dart';
import 'package:viviguamini/widgets/menubotones.dart';
import 'package:viviguamini/widgets/Theme.dart' as Tema;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bienvenidos!',
        home: Home(),
        );
  }
}

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("fotos/fondo2.jpg"), // <-- BACKGROUND IMAGE
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: <Widget>[
              Container(
                child: AppBarvivicarhue(),
                margin: EdgeInsets.only(top: 50.0),
              ),
              menubotones(),
              Container(
                height: 50.0,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 120.0),
              ),

            ],
          ),

        ),
      ],

    );
  }
}
