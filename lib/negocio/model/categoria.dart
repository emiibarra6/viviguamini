import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widgets/direcciones.dart' as dire;

class Categoria {
  final String id;
  final String nombre_c;
  final String icon;


  Categoria({this.id, this.nombre_c,this.icon});

  factory Categoria.fromJson(Map<String, dynamic> json) {   //Map, seria un arreglo, String seria
    //id, nombre_c, ico, dynamic es aceptable cualquier valor.
    return Categoria(
      id: json['id'],
      nombre_c: json['nombre_c'],
      icon: json ['icon'],

    );
  }
}

Future<List<Categoria>> fetchPostC() async {
  final response = await http.get( dire.direcciones.ipCategoria.toString().trim());
  //Revisamos si la respuesta es OK
  if (response.statusCode == 200) {
    //Listado de objetos json
    var jsonObject = json.decode(response.body);
    List jsonList = jsonObject["categoria"];
    //hacemos un mapeo, pasamos cada elemento a un objeto negocio
    return jsonList.map((i) => new Categoria.fromJson(i)).toList();
  } else {
    // si se responde con error, lanzamos una excepción
    //para que pueda ser detectada por el builder
    throw Exception('Failed to load post');
  }
}
