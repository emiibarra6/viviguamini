import 'package:http/http.dart' as http;

import 'dart:convert';
import '../../widgets/direcciones.dart' as dire;

class Negocio {
  final String title;
  final String description;
  final String imageUrl;
  final String x;
  final String y;
  final String celular;
  final String facebook;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final String imageUrl5;
  final String imageUrl6;
  final String horario;
  final String direccion;

  Negocio({this.direccion, this.title, this.description, this.imageUrl, this.x,this.y,this.celular,this.facebook,this.imageUrl2,this.imageUrl3,this.imageUrl4,this.imageUrl5,this.imageUrl6,this.horario});

  factory Negocio.fromJson(Map<String, dynamic> json) {

    return Negocio(
        title: json['nombre'],
        description: json['descripcion'],
        imageUrl: json['ruta_i'],
        imageUrl2: json['ruta_i2'],
        imageUrl3: json['ruta_i3'],
        imageUrl4: json['ruta_i4'],
        imageUrl5: json['ruta_i5'],
        imageUrl6: json['ruta_i6'],
        horario: json['horario'],
        direccion: json['direccion'],
        x: json['x'],
        y:json['y'],
        //celular:json['celular'],
        facebook:json['facebook'],
        );
  }
}

Future<List<Negocio>> fetchPost(String c) async {
  final cat = dire.Categoria();
  cat.setCategoria(c);
  final response = await http.get( dire.direcciones.ip.toString().trim() +  cat.getCategoria());
  //Revisamos si la respuesta es OK
  if (response.statusCode == 200) {
    //Listado de objetos json
    var jsonObject = json.decode(response.body);
    List jsonList = jsonObject["negocio"];
    //hacemos un mapeo, pasamos cada elemento a un objeto negocio
    return jsonList.map((i) => new Negocio.fromJson(i)).toList();
  } else {
    // si se responde con error, lanzamos una excepción
    //para que pueda ser detectada por el builder
    throw Exception('Failed to load post');
  }
}
