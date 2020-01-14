import 'package:flutter/material.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import '../widgets//Theme.dart' as Tema;


class borde_bottom extends StatefulWidget {
  @override
  _borde_bottomState createState() => _borde_bottomState();
}

class _borde_bottomState extends State<borde_bottom> {
  @override
  Widget build(BuildContext context) {


    final Widget = WaveWidget(
      config: CustomConfig(
        gradients: [
          [Tema.Colors.borde1, Tema.Colors.borde1],
          [Tema.Colors.borde2, Tema.Colors.borde2],
          [Tema.Colors.borde3, Tema.Colors.borde3],
          [Tema.Colors.borde1, Tema.Colors.borde2]
        ],
        durations: [35000, 19440, 10800, 6000],
        heightPercentages: [0.20, 0.23, 0.25, 0.30],
        blur: MaskFilter.blur(BlurStyle.solid, 10),
        gradientBegin: Alignment.bottomLeft,
        gradientEnd: Alignment.topRight,
      ),

      waveAmplitude: 0,
      size: Size(
        double.nan,
        double.nan,
      ),
    );

    return Widget;
  }
}


