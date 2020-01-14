import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widgets/direcciones.dart' as dire;

class Emergencia {
  final String nombre;
  final String celular;
  Emergencia({this.nombre, this.celular});

  factory Emergencia.fromJson(Map<String, dynamic> json) {
    return Emergencia(
      nombre: json['nombre'],
      celular: json['celular'],
    );
  }
}

Future<List<Emergencia>> fetchPost(String c) async {
  print("requesting..");
  final cat = dire.Categoria();
  cat.setCategoria(c);
  final response = await http.get(dire.direcciones.ipEmergencia.toString().trim() + cat.getCategoria().toString() );
  //Revisamos si la respuesta es OK
  if (response.statusCode == 200) {
    //Listado de objetos json
    var jsonObject = json.decode(response.body);
    List jsonList = jsonObject["emergencia"];
    //hacemos un mapeo, pasamos cada elemento a un objeto emergencia
    return jsonList.map((i) => new Emergencia.fromJson(i)).toList();
  } else {
    // si se responde con error, lanzamos una excepción
    //para que pueda ser detectada por el builder
    throw Exception('Failed to load post');
  }
}
