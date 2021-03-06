import 'package:flutter_clima/services/location.dart';

import 'networking.dart';

const apiKey = '7555f9fc90c8c804298742c06723c8ce';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    var cityWeatherUrl =
        '$openWeatherMapUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(cityWeatherUrl);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getCurrentLocation();

    var locationWeatherUrl =
        '$openWeatherMapUrl?lat=${myLocation.latitude}&lon=${myLocation.longitude}&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(locationWeatherUrl);

    var weatherData = await networkHelper.getData();
    print('weather data: $weatherData');
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
