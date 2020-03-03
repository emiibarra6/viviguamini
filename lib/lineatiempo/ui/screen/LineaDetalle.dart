import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:viviguamini/lineatiempo/model/salamone.dart';

class LineaDetalle extends StatefulWidget {
  final Salamone value;
  LineaDetalle({Key key, this.value}) : super(key: key);
  @override
  _LineaDetalle createState() => _LineaDetalle();
}


class _LineaDetalle extends State<LineaDetalle> {
  var anio = "";
  var sliderValue = 0.0;
  String foto = "";
  String Descripcion = "Desliza para ver mas info :)";

  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.value.nombre),
      ),
      body: Container(
        color: Color(0xffE5E5E5),
        child: Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                    child: Text(
                  "Scrollea el slider para ver mas info :)",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Container(
              child: Align(
                child: Material(
                  color: Colors.white,
                  elevation: 14.0,
                  borderRadius: BorderRadius.circular(24.0),
                  shadowColor: Color(0x802196F3),
                  child: Container(
                      width: 350.0,
                      height: MediaQuery.of(context).size.height - 164,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                child: Text(
                              anio,
                              style: TextStyle(
                                  color: Colors.black, fontSize: 22.0),
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height/3,
                                child: Image.network(
                              foto,
                                  fit: BoxFit.fill,
                                  loadingBuilder: (context , child, progress){
                                    return progress == null ? child : LinearProgressIndicator();
                                  } ,
                            )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(

                              child: Slider(
                                min: 0.0,
                                max: 10.0,
                                divisions: 3,
                                value: sliderValue,
                                onChanged: (newValue) {
                                  setState(() {
                                    sliderValue = newValue;
                                    if (sliderValue >= 0.0 &&
                                        sliderValue <= 2.5) {
                                      foto = widget.value.imageUrl1;
                                      anio = widget.value.anio1;
                                      Descripcion = widget.value.description;

                                    }
                                    if (sliderValue >= 2.6 &&
                                        sliderValue <= 5.1) {
                                      foto = widget.value.imageUrl2;
                                      anio = widget.value.anio2;
                                      Descripcion = widget.value.description2;

                                    }
                                    if (sliderValue >= 6.2 &&
                                        sliderValue <= 6.8) {
                                      foto = widget.value.imageUrl3;
                                      anio = widget.value.anio3;
                                      Descripcion = widget.value.description3;

                                    }
                                    if (sliderValue >= 6.9 &&
                                        sliderValue <= 10.0) {
                                      foto = widget.value.imageUrl4;
                                      anio = widget.value.anio4;
                                      Descripcion = widget.value.description4;
                                    }
                                  });
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(child: Text(Descripcion)),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
