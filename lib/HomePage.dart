import 'package:flutter/material.dart';
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
        home: Scaffold(
          body: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      bottomNavigationBar: Container(
        height: 50,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Tema.Colors.appBarCeleste,
                  Tema.Colors.borde1
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp

            )

        ),

      ),
    );
  }
}
