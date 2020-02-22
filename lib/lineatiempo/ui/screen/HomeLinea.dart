import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:viviguamini/widgets/Theme.dart' as Tema;


class LineaTiempo extends StatefulWidget {
  @override
  _LineaTiempo createState() {
    return _LineaTiempo();
  }
}

class _LineaTiempo extends State {


  onChanged(double value) {
    setState(() {

    });
  }

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

  }
}
