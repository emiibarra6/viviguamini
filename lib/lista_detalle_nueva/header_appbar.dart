import 'package:flutter/material.dart';
import 'gradiente_back.dart';
import 'cad_image_list.dart';

class HeaderAppBar extends StatelessWidget {

  final String i1,i2,i3,i4,i5,i6;
  HeaderAppBar(this.i1,this.i2,this.i3,this.i4,this.i5,this.i6);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack("Bienvenido"),
        CardImageList(i1,i2,i3,i4,i5,i6),
      ],
    );
  }

}