import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class AutoPlacesViewModel extends ChangeNotifier {
  late PlaceModel _selectedPlace;
  PlaceModel get selectePlace => _selectedPlace;
  final _api = locator<Api>();
  late WeatherModel _weathers;
  //late Position _currentPosition;

  Future<WeatherModel> getLocWeathers(city) async {
    var weatherResults = await _api.getWeather(city);
    return weatherResults;
  }

  Future<PlaceModel> getLocationAttr({
    required PlaceModel prediction,
  }) async {
    List placemarks = await placemarkFromCoordinates(
      prediction.lat,
      prediction.lan,
    );
    print(placemarks[0]);
    var city = placemarks[0].locality;
    WeatherModel weatherModel = await getLocWeathers(city);
    _selectedPlace = PlaceModel(
        city: city,
        formatted_address: prediction.formatted_address,
        lat: prediction.lat,
        lan: prediction.lan,
        temp: weatherModel.temp,
        humidity: weatherModel.humidity,
        maxTemp: weatherModel.temp_max,
        minTemp: weatherModel.temp_min,
        name: weatherModel.main);
    notifyListeners();
    return _selectedPlace;
  }
  Future<String> _getAddressFromLatLng(
    _currentPosition,
  ) async {
    List<Placemark> p = await placemarkFromCoordinates(
        _currentPosition.latitude, _currentPosition.longitude);

    Placemark place = p[0];
    print("USER_ADDRESS:::${place.locality}");
    return "${place.locality}";
  }

  Future<String> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    Position _position = await Geolocator.getCurrentPosition();
    return _getAddressFromLatLng(
      _position,
    );
  }
}
