class WeatherModel {
  final temp;
  final pressure;
  final humidity;
  final temp_max;
  final temp_min;
  final main;

  WeatherModel(
    this.temp,
    this.pressure,
    this.humidity,
    this.temp_max,
    this.temp_min,
    this.main,
  );

  factory WeatherModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return WeatherModel(
      json['main']["temp"],
      json['main']["pressure"],
      json['main']["humidity"],
      json['main']["temp_max"],
      json['main']["temp_min"],
      json['weather'][0]['main'],
    );
  }
}
