import 'package:flutter/material.dart';
import 'package:viviguamini/Loader/ColorLoader3.dart';
import 'package:viviguamini/entidades/categoria.dart';
import 'package:viviguamini/lista_negocio/pantalla_lista.dart';

class botonescategoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(
        title: Text('Categorias'),
        list: fetchPostC(),
      ),
    );
  }


}




class Page extends StatelessWidget {
  @required
  final Text title; //Titulo a mostrar
  @required
  final Future<List<Categoria>> list;
  Page({this.title, this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: this.title,
      ),
      body: FutureBuilder<List<Categoria>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data.length,
                gridDelegate:
                new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3
                ),

                itemBuilder: (context, index) {
                  Categoria cat = snapshot.data[index];
                  return CategoriaItem(
                    cat: cat,
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return Center(
            child: ColorLoader3(
              radius: 20.0,
              dotRadius: 5.0,
            ),
          );
        },

      ),
    );
  }
}

class CategoriaItem extends StatelessWidget {
  @required
  final Categoria cat;
  CategoriaItem({this.cat});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: _launchURL,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
          elevation: 3.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 5),
                child:Text(
                  cat.nombre_c,
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),

              Image.network(cat.icon),
            ],

          ),

      ),
      onTap: (){ // Esto se ejecutará mediante un callback y enviará a la página de negociossss.
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => pantalla_lista(categoria: cat.id)
            )
        );

      },
    );
  }

}

