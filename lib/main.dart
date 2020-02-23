import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:viviguamini/HomePage.dart';
import 'package:viviguamini/widgets/AppBarrvivicarhue.dart';
import 'package:viviguamini/widgets//Theme.dart' as Tema;

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
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

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Welcome to Flutter',
        home: Scaffold(
          body: HomePageBody(),
        ));
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
              height: 240.0,
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

class MyClipper extends CustomClipper<Path> {
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 20.0);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 55);
    var secondEndPoint = Offset(size.width, size.height - 30);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
