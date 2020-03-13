import 'package:flutter/material.dart';
import 'package:viviguamini/negocio/model/categoria.dart';
import '../widgets/botonescategoria.dart';

class categoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: botonescategoria(
        title: Text('Categorias'),
        list: fetchPostC(),
      ),
    );

  }
}
