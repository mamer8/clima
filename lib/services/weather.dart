import 'package:climaa/services/networking.dart';
import 'package:climaa/services/location.dart';

class WeatherModel {
  static const apikey = '5848ff283a2c7b686dc1cd8b77102b38';
  static const onlineURL = 'https://api.openweathermap.org/data/2.5/weather';
  Future<dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper("$onlineURL?q=$cityName&appid=$apikey&units=metric");
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherUpdate() async {
    Location locationss = Location();
    await locationss.getcurrentlocation();

    NetworkHelper networkHelper = NetworkHelper(
        "$onlineURL?lat=${locationss.latitude}&lon=${locationss.longitude}&appid=$apikey&units=metric");
    var weatherData = await networkHelper.getData();
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
