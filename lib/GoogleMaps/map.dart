import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'DirectionProvider.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMaps extends StatefulWidget {
  final String x, y;
  final LatLng l;
  GoogleMaps(this.x, this.y, this.l);

  static ChangeNotifierProvider init(double x, double y, LatLng l ) =>  ChangeNotifierProvider<DirectionProvider>(
      create: (_) => new DirectionProvider(),
      child: GoogleMaps(x.toString(),y.toString(),l)
  );

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  Position _currentPosition;
  LatLng toPoint;


  void initState() {
    toPoint = new LatLng(double.parse(widget.x), double.parse(widget.y));
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
              target: widget.l,
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
      position: widget.l,
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
    await api.findDirections(widget.l, toPoint);

    var left = min(widget.l.latitude, toPoint.latitude); //SE CALCULA COORDENADAS.
    var right = max(widget.l.latitude, toPoint.latitude);
    var top = max(widget.l.longitude, toPoint.longitude);
    var bottom = min(widget.l.longitude, toPoint.longitude);

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



}




