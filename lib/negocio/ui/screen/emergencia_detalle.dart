import 'package:flutter/material.dart';
import 'package:viviguamini/negocio/model/Emergencia.dart';
import 'package:url_launcher/url_launcher.dart';

class emergencia_detalle extends StatelessWidget {
  @override
  final String categoria;
  emergencia_detalle({Key key, this.categoria}) : super(key: key);

  Widget build(BuildContext context) {

    return MaterialApp(
      home: Page(
        list: fetchPost(categoria),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @required
  final Future<List<Emergencia>> list;
  Page({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<Emergencia>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Emergencia emergencia = snapshot.data[index];
                  return EmergenciaItem(
                    emergencia: emergencia,
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

class EmergenciaItem extends StatelessWidget {
  @required
  final Emergencia emergencia;
  EmergenciaItem({this.emergencia});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Card(
        margin: EdgeInsets.only(
          top: 20.0,
            bottom: 20.0
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      emergencia.nombre,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              InkWell(
                  child: Container(
                        child: Icon(
                          Icons.call,
                          size: 50.0,
                          color: Color(0xFFCCCCCC),
                        ),
                  ),
                  onTap: () {
                    _launchURL();
                  }
              ),
              Text(emergencia.celular),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    var url = 'tel: '+emergencia.celular;
    print(emergencia.celular);
    if (emergencia.celular != null){
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }


    }else{
      AlertDialog(
        content: Text('No contiene numero telefonico'),
      );
    }
  }
}
