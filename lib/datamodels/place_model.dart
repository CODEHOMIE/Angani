import 'dart:convert';

class PlaceModel {
  var lat;
  var lan;
  var city;
  var formatted_address;
  var temp;
  var maxTemp;
  var minTemp;
  var humidity;
  var name;

  PlaceModel({
    this.lat,
    this.lan,
    this.city,
    this.formatted_address,
    this.temp,
    this.humidity,
    this.maxTemp,
    this.minTemp,
    this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'formatted_address': formatted_address,
      'lat': lat,
      'lan': lan,
      'city': city,
    };
  }

  factory PlaceModel.fromMap(Map<String, dynamic> map) {
    return PlaceModel(
      formatted_address: map['formatted_address'],
      lat: map['geometry']['location']['lat'],
      lan: map['geometry']['location']['lng'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceModel.fromJson(String source) =>
      PlaceModel.fromMap(json.decode(source),);
}
