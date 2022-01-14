class WeatherIcons {
  String weatherIcon(String _weather) {
      print('weather main:: $_weather');
      switch (_weather) {
        case 'CLEAR':
          return 'assets/svgs/hot_weather.svg';
        case 'CLOUDS':
          return 'assets/svgs/cloudy_weather.svg';
        case 'RAIN':
          return 'assets/svgs/bad_weather.svg';
        case 'SUNNY':
          return 'assets/svgs/sunny_weather.svg';
        case 'RAIN':
          return 'assets/svgs/weather_rain.svg';
      }
      return 'assets/svgs/sunny_weather.svg';
    }
}