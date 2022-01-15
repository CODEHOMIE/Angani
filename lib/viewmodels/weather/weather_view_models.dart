import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class WeatherViewModels extends ChangeNotifier {
  final _api = locator<Api>();

  WeatherModel _weathers = WeatherModel(0.0, 0.0, 0.0, 0.0, 0.0, '');
  WeatherModel get weathers => _weathers;

  Future getWeathers() async {
    var currentUserLoc = await AutoPlacesViewModel().getCurrentLocation();
    var weatherResults = await _api.getWeather(currentUserLoc);

    if (weatherResults is String) {
      //error
    } else {
      _weathers = weatherResults;
    }
    notifyListeners();
  }
}
