import 'package:flutter/material.dart';

class LineaTiempo extends StatefulWidget {
  @override
  _LineaTiempo createState() {
    return _LineaTiempo();
  }
}

class _LineaTiempo extends State {
  double _value = 5;

  onChanged(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Slider Tutorial',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Slider Tutorial'),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  child: Slider(
                    value: _value,
                    onChanged: onChanged,
                    min: 1,
                    max: 15,
                    divisions: 5,
                  ),
                ),
              ],
            )));
  }
}
