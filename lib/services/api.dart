import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:http/http.dart';

class Api {

  Future<List<ForecastModel>> getForecast5(city) async {
    Response response = await get(
      Uri.parse(
        "${Urls.FORECAST_URL}nairobi&${Urls.APP_ID}",
      ),
    ).timeout(Duration(seconds: 20), onTimeout: () {
      return timeoutResponse;
    });
    Map data = jsonDecode(response.body);

    List predictions = data['list'];
    return predictions.map((prediction) {
      return ForecastModel.fromMap(prediction);
    }).toList();
  }

  Future<WeatherModel> getWeather(
    String city,
  ) async {
    final result = await http.Client().get(
      Uri.parse(
        "${Urls.WEATHER_URL}nairobi&${Urls.APP_ID}",
      ),
    );
    
    if (result.statusCode != 200) {
      throw Exception();
    }

    return parsedJson(result.body);
  }

  WeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);

    final jsonWeather = jsonDecoded;

    return WeatherModel.fromJson(jsonWeather);
  }

  Response timeoutResponse =
      Response('{"type":"error", "msg":"Sorry, request timeout"}', 408);

  Future<List<PlaceModel>> getPlacesAutoComplete({
    required String query,
    var city,
  }) async {
    String url =
        '${Urls.PLACE_API}${Urls.MAP_KEY}&query=$query';

    Response response = await get(
      Uri.parse(
        url,
      ),
    ).timeout(Duration(seconds: 20), onTimeout: () {
      return timeoutResponse;
    });
    Map data = jsonDecode(response.body);

    List predictions = data['results'];
    return predictions.map((prediction) {
      return PlaceModel.fromMap(prediction);
    }).toList();
  }

  Future<List<SavedModel>> getSavedLoc() async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    // Fetch and decode data
    final String? savedString = _prefs.getString('saved_key');

    final List<SavedModel> saved = SavedModel.decode(savedString!);

    return saved;
  }
}
