import 'package:flutter/material.dart';
import 'package:viviguamini/negocio/ui/widgets/map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:viviguamini/widgets/Theme.dart' as Tema;

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
    return Padding(
    padding: const EdgeInsets.all(20.0),
    child:InkWell(
      onTap: () {
        _getCurrentLocation();
        if(_currentPosition != null){
          l = LatLng(_currentPosition.latitude ,_currentPosition.longitude);
          Route route = MaterialPageRoute(builder: (context) => GoogleMaps.init(double.parse(widget.x),double.parse(widget.y), l));
          Navigator.push(context, route);
        }

      },

        child: Container(
          height: 50.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.0),
              gradient: LinearGradient(
                  colors: [
                    Tema.Colors.appBarCeleste,
                    Tema.Colors.borde1
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