import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../widgets/direcciones.dart' as dire;

class Farmacia {
  final String title;
  final String imageUrl;
  final String imageUrl2;
  final String imageUrl3;
  final String imageUrl4;
  final String imageUrl5;
  final String imageUrl6;
  final String x;
  final String y;
  final String celular;


  Farmacia({this.imageUrl2, this.imageUrl3, this.imageUrl4, this.imageUrl5, this.imageUrl6,this.title, this.imageUrl, this.x,this.y,this.celular});

  factory Farmacia.fromJson(Map<String, dynamic> json) {

    return Farmacia(
      title: json['nombre'],
      imageUrl: json['ruta_imagen'],
        imageUrl2: json['ruta_imagen2'],
        imageUrl3: json['ruta_imagen3'],
        imageUrl4: json['ruta_imagen4'],
        imageUrl5: json['ruta_imagen5'],
        imageUrl6: json['ruta_imagen6'],
      x: json['x'],
      y:json['y'],
      celular:json['celular'],

    );
  }
}

Future<List<Farmacia>> fetchPost() async {
  final response = await http.get( dire.direcciones.ipFarmacia.toString().trim() );
  if (response.statusCode == 200) {
    var jsonObject = json.decode(response.body);
    List jsonList = jsonObject["farmacia"];
    print(jsonList);
    return jsonList.map((i) => new Farmacia.fromJson(i)).toList();
  } else {
    throw Exception('Failed to load post');
  }
}
