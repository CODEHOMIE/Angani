import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class WeatherMidItem extends StatelessWidget {
  final WeatherModel weather;
  WeatherMidItem({
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {

  Widget _midPartTile(
    val,
    subStr,
  ) =>
      Container(
        child: Column(
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: new TextSpan(
                style: new TextStyle(
                  height: 1.2,
                  color: Colors.white,
                  wordSpacing: 1.2,
                ),
                children: <TextSpan>[
                  new TextSpan(
                    text: "$val°\n",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: Str.APP_FONT,
                      fontSize: 19.0,
                    ),
                  ),
                  new TextSpan(
                    text: subStr,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: Str.APP_FONT,
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      );

       Widget _midPartView() => Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _midPartTile(weather.temp_min.round(),'min'),
            _midPartTile(weather.temp.round(), 'current'),
            _midPartTile(weather.temp_max.round(),'max'),
          ],
        ),
      );

    return _midPartView();
  }
}
