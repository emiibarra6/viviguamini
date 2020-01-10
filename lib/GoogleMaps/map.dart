import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'DirectionProvider.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMaps extends StatefulWidget {
  final String x, y;
  GoogleMaps(this.x, this.y);
  final LatLng fromPoint = LatLng(-37.020125, -62.409399);

  static ChangeNotifierProvider init(double x, double y) =>  ChangeNotifierProvider<DirectionProvider>(
      create: (_) => new DirectionProvider(),
      child: GoogleMaps(x.toString(),y.toString())
  );

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  Position _currentPosition;
  LatLng toPoint;
  LatLng fromPoint;

  void initState() {
    _getCurrentLocation3();
    toPoint = new LatLng(double.parse(widget.x), double.parse(widget.y));
    fromPoint = LatLng(_currentPosition.latitude , _currentPosition.longitude);
    super.initState();
  }

  GoogleMapController _mapController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps'),
      ),
      body:  Consumer<DirectionProvider>(
        builder: (BuildContext context, DirectionProvider api,
            Widget child) {
          return GoogleMap(
            initialCameraPosition: CameraPosition(
              target: fromPoint,
              zoom: 12,
            ),
            markers: _createMarkers(),
            polylines: api.currentRoute,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.zoom_out_map),
        onPressed: _centerView,
      ),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();

    tmp.add(Marker(
      markerId: MarkerId("FromPoint"),
      position: fromPoint,
      infoWindow: InfoWindow(title: "estoy aca"),
    ));

    tmp.add(Marker(
      markerId: MarkerId("toPoint"),
      position: toPoint,
      infoWindow: InfoWindow(title: "llegada"),
    ));
    return tmp;
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;

    _centerView();
  }

  _centerView() async {
    var api = Provider.of<DirectionProvider>(context);

    await _mapController.getVisibleRegion();

    print("buscando direcciones");
    await api.findDirections(fromPoint, toPoint);

    var left = min(
        fromPoint.latitude, toPoint.latitude); //SE CALCULA COORDENADAS.
    var right = max(fromPoint.latitude, toPoint.latitude);
    var top = max(fromPoint.longitude, toPoint.longitude);
    var bottom = min(fromPoint.longitude, toPoint.longitude);

    api.currentRoute.first.points.forEach((point) {
      left = min(left, point.latitude);
      right = max(right, point.latitude);
      top = max(top, point.longitude);
      bottom = min(bottom, point.longitude);
    });

    var bounds = LatLngBounds(
      southwest: LatLng(left, bottom),
      northeast: LatLng(right, top),
    );
    var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    _mapController.animateCamera(cameraUpdate);
  }


  double _getCurrentLocation() {
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    StreamSubscription<Position> positionStream = geolocator.getPositionStream(locationOptions).listen((Position position) {
          return position.latitude;
        });

  }

  double _getCurrentLocation2() {
    var geolocator = Geolocator();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.high, distanceFilter: 10);
    StreamSubscription<Position> positionStream = geolocator.getPositionStream(locationOptions).listen((Position position) {
      return position.longitude;

    });

  }

  _getCurrentLocation3() {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }


}




