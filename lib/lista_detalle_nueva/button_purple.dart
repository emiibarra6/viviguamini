import 'package:flutter/material.dart';
import 'package:viviguamini/GoogleMaps/map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class ButtonPurple extends StatefulWidget {
    String x,y ;
    ButtonPurple(this.x , this.y);
  _ButtonPurple createState() => _ButtonPurple();
}

class _ButtonPurple extends State<ButtonPurple>{
  Position _currentPosition;
  LatLng l;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {
        _getCurrentLocation();
        if(_currentPosition != null){
          l = LatLng(_currentPosition.latitude ,_currentPosition.longitude);
          Route route = MaterialPageRoute(builder: (context) => GoogleMaps.init(double.parse(widget.x),double.parse(widget.y), l));
          Navigator.push(context, route);
        }

      },
      child: Container(
        margin: EdgeInsets.only(
            top: 30.0,
            left: 20.0,
            right: 20.0
        ),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [
                  Color(0xFF4268D3),
                  Color(0xFF584CD1)
                ],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp

            )

        ),

        child: Center(
          child: Text(
            "Navegar!!!",
            style: TextStyle(
                fontSize: 18.0,
                fontFamily: "Lato",
                color: Colors.white,
                decoration: TextDecoration.none,
            ),

          ),
        ),

      ),
    );
  }


  _getCurrentLocation() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
    geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }



}