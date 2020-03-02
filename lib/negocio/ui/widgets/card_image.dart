import 'package:flutter/material.dart';

class  CardImage extends StatelessWidget {

  final String pathImage;

  CardImage(this.pathImage);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: 350.0,
      width: 250.0,
      margin: EdgeInsets.only(
          top: 80.0,
          left: 20.0

      ),
      child: Image.network(pathImage,
          fit: BoxFit.cover,
          loadingBuilder: (context , child, progress){
            return progress == null ? child : LinearProgressIndicator();
          } ,
      ),
      decoration: BoxDecoration(

          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          shape: BoxShape.rectangle,
          boxShadow: <BoxShadow>[
            BoxShadow (
                color:  Colors.black38,
                blurRadius: 15.0,
                offset: Offset(0.0, 7.0)
            )
          ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
      ],
    );
  }

}