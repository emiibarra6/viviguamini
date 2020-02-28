import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widgets/direcciones.dart' as dire;

class Salamone {
  final String nombre;
  final String description;
  final String description2;
  final String description3;
  final String description4;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final String x;
  final String y;
  final String anio1;
  final String anio2;
  final String anio3;
  final String anio4;

  Salamone({this.description2, this.description3, this.description4, this.nombre, this.description, this.imageUrl1, this.imageUrl2, this.imageUrl3,this.imageUrl4,this.x,this.y,this.anio1,this.anio2,this.anio3,this.anio4});

  factory Salamone.fromJson(Map<String, dynamic> json) {

    return Salamone(
      nombre: json['nombre'],
      description: json['descripcion'],
      description2: json['descripcion2'],
      description3: json['descripcion3'],
      description4: json['descripcion4'],
      imageUrl1: json['foto1'],
      imageUrl2: json['foto2'],
      imageUrl3: json['foto3'],
      imageUrl4: json['foto4'],
      anio1: json['anio1'],
      anio2: json['anio2'],
      anio3: json['anio3'],
      anio4: json['anio4'],
      x: json['x'],
      y:json['y'],

    );
  }
}

Future<List<Salamone>> fetchPost() async {
  final response = await http.get( dire.direcciones.ipSalamone.toString().trim() );
  //Revisamos si la respuesta es OK
  if (response.statusCode == 200) {
    //Listado de objetos json
    var jsonObject = json.decode(response.body);
    List jsonList = jsonObject["salamone"];
    //hacemos un mapeo, pasamos cada elemento a un objeto negocio
    return jsonList.map((i) => new Salamone.fromJson(i)).toList();
  } else {
    // si se responde con error, lanzamos una excepción
    //para que pueda ser detectada por el builder
    throw Exception('Failed to load post');
  }
}
