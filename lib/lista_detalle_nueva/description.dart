import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'button_purple.dart';
import 'package:viviguamini/inicio_splash/Theme.dart' as Tema;
import 'package:viviguamini/icons.dart';
import 'package:viviguamini/GoogleMaps/map.dart';
class DescriptionPlace extends StatelessWidget {

  String descriptionPlace, celular, facebook, instagram, namePlace,x,y;

  DescriptionPlace(this.namePlace, this.descriptionPlace , this.celular,  this.facebook , this.instagram, this.x, this.y);



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final title_stars = Row (
      children: <Widget>[
        Container (
          margin: EdgeInsets.only(
              top: 350.0,
              left: 20.0,
              right: 20.0
          ),

          child: Text(
            namePlace,
            style: TextStyle(
                fontFamily: "Lato",
                fontSize: 30.0,
              color: Tema.Colors.borde1,
              decoration: TextDecoration.none
            ),
            textAlign: TextAlign.left,
          ),

        ),

      ],
    );

    final description = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0

      ),
      child: new Text(
        descriptionPlace,
        style: const TextStyle(
            fontFamily: "Lato",
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFF56575a),
          decoration: TextDecoration.none
        ),

      ),
    );

    final redes = Container(
      margin: new EdgeInsets.only(
          top: 20.0,
          left: 20.0,
          right: 20.0
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          InkWell(
              child:Icon(
               MyFlutterApp.facebook_circled,
                size: 40,
               color: Tema.Colors.boton3,
             ),
              onTap: () {
                _launchURLToFacebook(facebook);
              }
          ),
          InkWell(
            child: Icon(
              MyFlutterApp.instagram,
              size: 40,
              color: Tema.Colors.boton3,
            ),
              onTap: () {
                _launchURLToFacebook(instagram);
              }
          ),
          InkWell(
            child: Icon(
              MyFlutterApp.phone,
              size: 40,
              color: Tema.Colors.boton3,
            ),
              onTap: () {
                _launchURL();
              }
          )

        ],
      ),
    );



    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        title_stars,
        description,
        redes,
       //map,
        ButtonPurple(x,y)
      ],
    );


  }
  _launchURL() async {
    var url = 'tel: '+celular;
    if (celular != null){
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


  _launchURLToFacebook(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}


