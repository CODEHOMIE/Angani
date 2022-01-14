import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

class SavedViewModels extends ChangeNotifier {
  final _api = locator<Api>();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  late List<SavedModel> _savedList;
  List<SavedModel> get saved => _savedList;

  Future getSavedList() async {
    var savedResults = await _api.getSavedLoc();
    _savedList = savedResults;
    notifyListeners();
  }

  void saveWeatherLocation(SavedModel val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Encode and store data in SharedPreferences
    final String encodedData = SavedModel.encode([
      val,
    ]);

    await prefs.setString('saved_key', encodedData);
    notifyListeners();
  }
}
