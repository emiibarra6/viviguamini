import 'package:flutter/material.dart';
import 'package:viviguamini/negocio/model/Farmacia.dart';
import 'package:viviguamini/negocio/ui/widgets/description.dart';
import 'package:viviguamini/negocio/ui/widgets/header_negocio.dart';

class farmacia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Page(
        list: fetchPost(),
      ),
    );
  }
}

class Page extends StatelessWidget {
  @required
  final Future<List<Farmacia>> list;
  Page({this.list});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: this.title,
      ),
      body: FutureBuilder<List<Farmacia>>(
        future: list,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  Farmacia farmacia = snapshot.data[index];
                  return FarmaciaItem(
                    farmacia: farmacia,
                  );
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          // By default, show a loading spinner
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class FarmaciaItem extends StatelessWidget {
  @required
  final Farmacia farmacia;
  FarmaciaItem({this.farmacia});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              DescriptionPlace(farmacia.title, farmacia.celular , "2923690749" , "facebook" , "instagram" , farmacia.x , farmacia.y),
              // ReviewList()
            ],
          ),
          HeaderAppBar(farmacia.imageUrl,farmacia.imageUrl2,farmacia.imageUrl3,farmacia.imageUrl4,farmacia.imageUrl5,farmacia.imageUrl6)
        ],
      ),
    );
  }
}
