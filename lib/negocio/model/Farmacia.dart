import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widgets/direcciones.dart' as dire;

class Farmacia {
  final String title;
  final String imageUrl;
  final String x;
  final String y;
  final String celular;
  final String fecha;


  Farmacia({this.title, this.imageUrl, this.x,this.y,this.celular,this.fecha});

  factory Farmacia.fromJson(Map<String, dynamic> json) {

    return Farmacia(
      title: json['nombre'],
      imageUrl: json['ruta_imagen'],
      x: json['x'],
      y:json['y'],
      celular:json['celular'],
      fecha: json['fecha']
    );
  }
}

Future<List<Farmacia>> fetchPost() async {
  print("requesting..");
  final response = await http.get( dire.direcciones.ipFarmacia.toString().trim() );
  //Revisamos si la respuesta es OK
  if (response.statusCode == 200) {
    //Listado de objetos json
    var jsonObject = json.decode(response.body);
    List jsonList = jsonObject["farmacia"];
    //hacemos un mapeo, pasamos cada elemento a un objeto negocio
    return jsonList.map((i) => new Farmacia.fromJson(i)).toList();
  } else {
    // si se responde con error, lanzamos una excepción
    //para que pueda ser detectada por el builder
    throw Exception('Failed to load post');
  }
}
