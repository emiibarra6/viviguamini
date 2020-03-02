import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:viviguamini/lineatiempo/model/salamone.dart';
import 'package:viviguamini/widgets/Loader/ColorLoader3.dart';
import 'package:viviguamini/lineatiempo/ui/screen/LineaDetalle.dart';
=======
import 'package:viviguamini/widgets/Theme.dart' as Tema;

>>>>>>> 3482873fba679ed92dc425c1b4f46e62a4c1cf49

class LineaTiempo extends StatefulWidget {
  @override
  _LineaTiempo createState() {
    return _LineaTiempo();
  }
}

class _LineaTiempo extends State {
<<<<<<< HEAD
  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Ruta Salamone",
        home: PageSalamone(
          list: fetchPost(),
        ),
      );
    }
  }

class PageSalamone extends StatelessWidget{
  final Future<List<Salamone>> list;
  PageSalamone({ this.list});

  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Salamone>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Salamone salamone = snapshot.data[index];
                  return NegocioItem(salamone: salamone);
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
=======


  onChanged(double value) {
    setState(() {

    });
>>>>>>> 3482873fba679ed92dc425c1b4f46e62a4c1cf49
  }
}

<<<<<<< HEAD
class NegocioItem extends StatelessWidget {
  @required
  final Salamone salamone;
  NegocioItem({this.salamone});
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
                  salamone.imageUrl1,
                  fit: BoxFit.fill,
                ),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Text(
                salamone.nombre,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

            ],
          ),
        ),
      ),
      onTap: () {
        Route route =
        MaterialPageRoute(builder: (context) => LineaDetalle(value: salamone));
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
=======
  void initState() {

  }


  Widget header(){
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.blue,
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      child: Text(
        "Bienvenidos",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
        ),
      ),


    );
  }

  Widget fondoImagen(){
    return Container(
      color: Colors.red,
      height: MediaQuery.of(context).size.height / 2.2,
      width: MediaQuery.of(context).size.width / 1.1,

    );
  }

  Widget foto (){
    return Container(
      color: Colors.black,
      height: MediaQuery.of(context).size.height / 4.2,
      width: MediaQuery.of(context).size.width / 2.1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Slider Tutorial',
        home: Scaffold(
            body: Stack(
                children: <Widget>[
                  header(),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: <Widget>[

                         Center(
                           child:fondoImagen(),
                         ),

                       ],
                     ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      foto(),
                    ],

                  ),
                ],

            )

            )
    );

>>>>>>> 3482873fba679ed92dc425c1b4f46e62a4c1cf49
  }
}



