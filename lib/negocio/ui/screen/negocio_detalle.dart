import 'package:flutter/material.dart';
import '../widgets/description.dart';
import '../widgets/header_negocio.dart';
import 'package:viviguamini/negocio/model/Negocio.dart';

class HomeTrips extends StatefulWidget {
  final Negocio value;
  HomeTrips({Key key, this.value}) : super(key: key);
  @override
  _HomeTrips createState() => _HomeTrips();
}

class _HomeTrips extends State<HomeTrips> {



  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            ListView(
              children: <Widget>[
                DescriptionPlace(widget.value.title,  widget.value.description , "2923690749" , "facebook" , "instagram" , widget.value.x , widget.value.y),
                // ReviewList()
              ],
            ),
            HeaderAppBar(widget.value.imageUrl,widget.value.imageUrl2,widget.value.imageUrl3,widget.value.imageUrl4,widget.value.imageUrl5,widget.value.imageUrl6)
          ],
        ),
      )
    );





  }


}