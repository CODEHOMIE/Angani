import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class ExploreViewModels extends ChangeNotifier {
  final _api = locator<Api>();

  late List<PlaceModel> _places;
  List<PlaceModel> get places => _places;

  String city = '';
  void changeCity(String _city) {
    city = _city;
    notifyListeners();
  }

  Future getPlaces() async {
    var placesResults = await _api.getPlacesAutoComplete(
      query: city,
    );
    if (placesResults is String) {
      //error
    } else {
      _places = placesResults;
    }
    notifyListeners();
  }

  
}
