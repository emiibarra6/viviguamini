import 'package:flutter/material.dart';
import '../widgets//Theme.dart' as Tema;

class AppBarvivicarhue extends StatefulWidget {
  @override
  _AppBarvivicarhue createState() => _AppBarvivicarhue();
}

class _AppBarvivicarhue extends State<AppBarvivicarhue> {
  @override
  Widget build(BuildContext context) {
    final Widget = Container(
      padding: EdgeInsets.all(5.0),

      height: 85.0,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: RichText(
          text: TextSpan(
            text: '        Regalate un momento, \n\n',
            style: TextStyle(
              color: Colors.white,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Viví Guamini',
                style: Tema.TextStyles.appBarTitle,
              ),
            ],
          ),
        ),
      ),
      decoration: BoxDecoration(
        color: Tema.Colors.appBarCeleste
      ),
    );

    return Widget;
  }
}
