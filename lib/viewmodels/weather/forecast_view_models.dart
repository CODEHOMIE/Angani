import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class ForecastViewModels extends ChangeNotifier {
  final _api = locator<Api>();

  List<ForecastModel> _weathers = [];
  List<ForecastModel> get weathers => _weathers;

  Future getWeathers() async {
    var currentUserLoc = await AutoPlacesViewModel().getCurrentLocation();
    var weatherResults = await _api.getForecast5(currentUserLoc);

    if (weatherResults is String) {
      //error
    } else {
      _weathers = weatherResults;
    }
    notifyListeners();
  }
}
