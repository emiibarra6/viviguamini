import 'package:flutter/material.dart';
import 'package:viviguamini/negocio/model/Farmacia.dart';

class farmacia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page(
        list: fetchPost(),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @required
  final Future<List<Farmacia>> list;
  Page({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: this.title,
      ),
      body: FutureBuilder<List<Farmacia>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Farmacia farmacia = snapshot.data[index];
                  return FarmaciaItem(
                    farmacia: farmacia,
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class FarmaciaItem extends StatelessWidget {
  @required
  final Farmacia farmacia;
  FarmaciaItem({this.farmacia});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Card(
        margin: EdgeInsets.only(
          top: 320.0,
        ),
        child: Padding(
          padding: EdgeInsets.all(5),

          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.network(
                    farmacia.imageUrl,
                    width: 300,
                  ),
                ],
              ),
              Text(farmacia.celular),
              Text(
                farmacia.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                textAlign: TextAlign.center,
              ),
            ],
          ),
    ),
        ),

      onTap: () {
        /*Route route = MaterialPageRoute(builder: (context) => lista_negocio_detalle(value: negocio));
        Navigator.pushReplacement(context, route);*/
      },
    );
  }
}
