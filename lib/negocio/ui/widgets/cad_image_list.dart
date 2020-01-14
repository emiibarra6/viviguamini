import 'package:flutter/material.dart';
import 'card_image.dart';

class CardImageList extends StatelessWidget {

  final String i1,i2,i3,i4,i5,i6;

  CardImageList(this.i1,this.i2,this.i3,this.i4,this.i5,this.i6);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 350.0,
      child: ListView(
        padding: EdgeInsets.all(25.0),
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CardImage(i1),
          CardImage(i2),
         CardImage(i3),
          CardImage(i4),
         CardImage(i5),
        ],
      ),
    );
  }

}