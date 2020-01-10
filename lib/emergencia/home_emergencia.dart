import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:viviguamini/emergencia/emergencia_detalle.dart';
import 'package:viviguamini/inicio_splash/Theme.dart' as Tema;

class home_emergencia extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(backgroundColor: Tema.Colors.appBarCeleste,),
        body: Stack(
          children: <Widget>[
            menubotonesemergencia(),
          ],
        ));
  }
}

class menubotonesemergencia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final hospital = InkWell(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
              color: Tema.Colors.boton1,
              borderRadius: BorderRadius.all(const Radius.circular(20.0))),
          child: Icon(
            FontAwesomeIcons.hospital,
            size: 110.0,
          ),
        ),
        onTap: () {
          String c = "hospital";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => emergencia_detalle(categoria: c),
            ),
          );
        });

    final bomberos = InkWell(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
              color: Tema.Colors.boton2,
              borderRadius: BorderRadius.all(const Radius.circular(20.0))),
          child: Icon(
            FontAwesomeIcons.fire,
            size: 110.0,
          ),
        ),
        onTap: () {
          String c = "bomberos";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => emergencia_detalle(categoria: c),
            ),
          );
        });

    final policia = InkWell(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
              color: Tema.Colors.boton3,
              borderRadius: BorderRadius.all(const Radius.circular(20.0))),
          child: Image.network(
            "https://vivicarhue.000webhostapp.com/DBRemota/images/policia.png",
          ),
        ),
        onTap: () {
          String c = "policia";
          print(c);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => emergencia_detalle(categoria: c),
            ),
          );
        });

    final mecanico = InkWell(
        child: Container(
          width: 150.0,
          height: 150.0,
          decoration: BoxDecoration(
              color: Tema.Colors.boton4,
              borderRadius: BorderRadius.all(const Radius.circular(20.0))),
          child: Image.network(
            "https://vivicarhue.000webhostapp.com/DBRemota/images/icono_auto.png",
          ),
        ),
        onTap: () {
          String c = "mecanico";
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => emergencia_detalle(categoria: c),
            ),
          );
        });


    Widget buttonSection = Container(
      margin: EdgeInsets.only(
        top: 110.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          hospital,
          bomberos
        ],
      ),
    );

    Widget buttonSection2 = Container(
      margin: EdgeInsets.only(
        top: 20.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          policia,
          mecanico
        ],
      ),
    );

    return new Center(
      child: Column(
          children: <Widget>[
            buttonSection,
            buttonSection2

          ]
      ),
    );
  }
}
