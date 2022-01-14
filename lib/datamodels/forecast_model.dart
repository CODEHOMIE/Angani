import 'dart:convert';

class ForecastModel {
  var temp;
  var tempMin;
  var tempMax;
  var weatherMain;
  var weatherDesc;

  ForecastModel({
    this.temp,
    this.tempMin,
    this.tempMax,
    this.weatherDesc,
    this.weatherMain,
  });

  Map<String, dynamic> toMap() {
    return {
      'temp': temp,
      'tempMin': tempMin,
      'tempMax': tempMax,
      'weatherMain': weatherMain,
      'weatherDesc': weatherDesc
    };
  }

  factory ForecastModel.fromMap(Map<String, dynamic> map) {
    return ForecastModel(
      temp : map['main']["temp"],
        tempMin : map['main']["temp_main"],
        tempMax : map['main']["temp_max"],
        weatherMain : map['weather'][0]["description"],
        weatherDesc : map['weather'][0]['main'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ForecastModel.fromJson(String source) =>
      ForecastModel.fromMap(json.decode(source),);

}
