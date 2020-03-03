import 'package:flutter/material.dart';
import 'package:viviguamini/HomePage.dart';
import 'package:viviguamini/negocio/ui/screen/lista_categorias_negocio.dart';
import 'package:viviguamini/negocio/ui/screen/lista_negocios.dart';
import 'package:viviguamini/negocio/ui/screen/negocio_detalle.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());

      case '/categoria':
        return MaterialPageRoute(builder: (_) => categoria());

      case '/negocios':
          return MaterialPageRoute(
            builder: (_) => lista_negocios(
              categoria: args,
            ),
          );

      case '/negociodetalle':
          return MaterialPageRoute(
            builder: (_) => HomeTrips(
              value: args,
            ),
          );

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
