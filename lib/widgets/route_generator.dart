import 'package:flutter/material.dart';
import 'package:viviguamini/HomePage.dart';
import 'package:viviguamini/negocio/model/Negocio.dart';
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
          if (args is String) {
          return MaterialPageRoute(builder: (_) => lista_negocios(categoria: args,),);
        }break;

      case '/negociodetalle':
        if (args is Negocio) {
          return MaterialPageRoute(builder: (_) => HomeTrips(value: args,),);
        }
        // If args is not of the correct type, return an error page.
        // You can also throw an exception while in development.
        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
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