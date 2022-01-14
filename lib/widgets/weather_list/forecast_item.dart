import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForecastItem extends StatelessWidget {
  ForecastModel forecastModel;
  var day;
  ForecastItem({required this.forecastModel, this.day});

  @override
  Widget build(BuildContext context) {

    Widget _weatherIcon() => SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(
            WeatherIcons().weatherIcon(
              forecastModel.weatherDesc.toUpperCase(),
            ),
            color: Colors.white,
          ),
        );

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 6.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 128,
            child: Text(
              day,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          _weatherIcon(),
          Expanded(
            child: Container(),
          ),
          Text(
            '${forecastModel.temp.round()}°',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
