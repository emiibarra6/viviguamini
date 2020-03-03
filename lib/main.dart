import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:viviguamini/HomePage.dart';
import 'package:viviguamini/widgets/AppBarrvivicarhue.dart';
import 'package:viviguamini/widgets//Theme.dart' as Tema;
import 'package:viviguamini/widgets/route_generator.dart';


void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Welcome to Flutter',
  home: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //BLOQUEAR ROTRACION DE PANTALLA
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      body: HomePageBody(),
    );
  }
}

class HomePageBody extends StatefulWidget {
  @override
  _HomePageBodyState createState() => new _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    //SPLASH SCREEN
    super.initState();

    Future.delayed(Duration(seconds: 5),
        () {
      Route route = MaterialPageRoute(builder: (context) => HomePage());
        //Route route = MaterialPageRoute(builder: (context) => HomeTrips());
      Navigator.pushReplacement(context, route);
    });
  }

  @override
  Widget build(BuildContext context) {
    //PLASH SCREEN
    return new Scaffold(
      //appBar: new AppBar(),
      body: Stack(
        children: <Widget>[
          Container(
            height: 100.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(
              top: 70,
            ),
            decoration: BoxDecoration(
              color: Tema.Colors.appBarCeleste
            ),
            child: Center(
              child: Text(
                "¡Bienvenidos!",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Poppins',
                  letterSpacing: 0.8,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 170),
            child: Image.asset(
              'fotos/fondo.jpg',
              width: 600.0,
              height: 280.0,
              fit: BoxFit.cover,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Container(
            height: 50.0,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 390.0),
          ),
          Container(
            margin: EdgeInsets.only(top: 310),
              child: Center(
                child: AppBarvivicarhue()
              ),
          ),

        ],
      ),
    );
  }
}

