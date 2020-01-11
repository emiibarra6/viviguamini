import 'package:flutter/material.dart';
import 'package:viviguamini/inicio_splash/Theme.dart' as Tema;
import 'package:viviguamini/categoria/categoria.dart';
import 'package:viviguamini/emergencia/home_emergencia.dart';
import 'package:viviguamini/Farmacia/farmacia.dart';

class menubotones extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    final botonCategoria = new InkWell(
        child: new Container(
          padding: const EdgeInsets.only(
              top:3.7,
              left: 7,
          ),
        decoration: new BoxDecoration(
            border: Border.all(color: Tema.Colors.Blanco),
          borderRadius: new BorderRadius.all(const Radius.circular(2.0)),
          color: Tema.Colors.boton1,
            boxShadow: [new BoxShadow(          //SOMBRA
              color: Color(0xffA4A4A4),
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
            ),]
        ),
          width: MediaQuery.of(context).size.width - 30,
        height: 40.0,
        margin: EdgeInsets.only(top: 40.0),
          child: Text(
            'Categoria',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Tema.Colors.Blanco,
              fontSize: 25.0,
            ),
          ),

      ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => categoria()
            )
          );

        }
    );


    final botonEmergencia = new InkWell(
      child: new Container(
        padding: const EdgeInsets.only(
          top:3.7,
          left: 7,
        ),
        decoration: new BoxDecoration(
            border: Border.all(color: Tema.Colors.Blanco),
          borderRadius: new BorderRadius.all(Radius.circular(2.0)),
            color: Tema.Colors.boton2,
            boxShadow: [new BoxShadow(          //SOMBRA
              color: Color(0xffA4A4A4),
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
            ),]
        ),
        width: MediaQuery.of(context).size.width - 30,
        height: 40.0,
        margin: EdgeInsets.only(top: 20.0),
        child: new Text(
          'Emergencia',
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Tema.Colors.Blanco,
            fontSize: 25.0,
          ),
        ),
      ),
        onTap: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => home_emergencia()),
        ); }
    );


    final farmaciaTurno = new InkWell(
      child: new Container(
        padding: const EdgeInsets.only(
          top:3.7,
          left: 7,
        ),
        decoration: new BoxDecoration(
            border: Border.all(color: Tema.Colors.Blanco),
            borderRadius: new BorderRadius.all(const Radius.circular(2.0)),
            color: Tema.Colors.boton3,
            boxShadow: [new BoxShadow(          //SOMBRA
              color: Color(0xffA4A4A4),
              offset: Offset(1.0, 1.0),
              blurRadius: 2.0,
            ),]
        ),
        width: MediaQuery.of(context).size.width - 30,
        height: 40.0,
        margin: EdgeInsets.only(top: 20.0),
          child: new Text(
            'Farmacia de turno',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Tema.Colors.Blanco,
              fontSize: 25.0,
            ),

          ),
      ),
        onTap: () { Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => farmacia()),
        ); }
    );



    final botonEventos = new InkWell(
        child: new Container(
          padding: const EdgeInsets.only(
            top:3.7,
            left: 7,
          ),
          decoration: new BoxDecoration(
              border: Border.all(color: Tema.Colors.Blanco),
              borderRadius: new BorderRadius.all(const Radius.circular(2.0)),
              color: Tema.Colors.boton4,
              boxShadow: [new BoxShadow(          //SOMBRA
                color: Color(0xffA4A4A4),
                offset: Offset(1.0, 1.0),
                blurRadius: 2.0,
              ),]
          ),
          width: MediaQuery.of(context).size.width - 30,
          height: 40.0,
          margin: EdgeInsets.only(top: 20.0),
            child: new Text(
              'Eventos',
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Tema.Colors.Blanco,
                fontSize: 25.0,
              ),

            ),
        ),
        onTap: () { print('onTap'); }
    );



    return new Center(
        child: Column(
        children: <Widget>[
            botonCategoria,
            botonEmergencia,
            farmaciaTurno,
            botonEventos
        ]
        ),
    );

  }


}