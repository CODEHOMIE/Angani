import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class WeatherItem extends StatelessWidget {
  final WeatherModel weather;
  WeatherItem({
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      height: MediaQuery.of(context).size.height * .43,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: new TextSpan(
            style: new TextStyle(
              height: 1.2,
              color: Colors.white,
              wordSpacing: 1.2,
            ),
            children: <TextSpan>[
              new TextSpan(
                text: "${weather.temp.round()}",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: Str.APP_FONT,
                  fontSize: 60.0,
                ),
              ),
              new TextSpan(
                text: "°\n",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: Str.APP_FONT,
                  fontSize: 60.0,
                ),
              ),
              new TextSpan(
                text: "${weather.main.toUpperCase()}\n\n",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: Str.APP_FONT,
                  fontSize: 25.0,
                  wordSpacing: 1.7,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
