import 'package:flutter/material.dart';
import 'package:viviguamini/Loader/ColorLoader3.dart';
import 'package:viviguamini/entidades/Negocio.dart';
import 'package:viviguamini/lista_detalle_nueva/home_trips.dart';
import 'package:viviguamini/lista_negocio/pantalla_sindatos.dart';

class pantalla_lista extends StatelessWidget {
  final String categoria;
  pantalla_lista({Key key, this.categoria}) : super(key: key);
  final String title = "Listado";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: this.title,
      home: Page(
        title: Text(this.title),
        list: fetchPost(categoria),
      ),
    );
  }
}

//Pantalla principal
class Page extends StatelessWidget {
  @required
  final Text title; //Titulo a mostrar
  @required
  final Future<List<Negocio>> list;
  Page({this.title, this.list});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this.title,
      ),
      body: FutureBuilder<List<Negocio>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Negocio negocio = snapshot.data[index];
                  return NegocioItem(negocio: negocio);
                });
          } else if (snapshot.hasError) {
            //return pantalla_sindatos();
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return Center(
            child: ColorLoader3(
              radius: 20.0,
              dotRadius: 5.0,
            ),
          );
        },
      ),
    );
  }
}

class NegocioItem extends StatelessWidget {
  @required
  final Negocio negocio;
  NegocioItem({this.negocio});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Image.network(
                  negocio.imageUrl,
                  fit: BoxFit.cover,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Text(
                negocio.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Text(
                negocio.horario,
                style: TextStyle(
                    color: getColor(negocio.horario),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        // Esto se ejecutará mediante un callback y enviará a la página detalle
        Route route =
            MaterialPageRoute(builder: (context) => HomeTrips(value: negocio));
        Navigator.push(context, route);
      },
    );
  }

  Color getColor(String selector) {
    if (selector == "Siempre abierto") {
      return Colors.green;
    } else {
      return Colors.black;
    }
  }
}
