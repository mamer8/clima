import 'package:flutter/material.dart';
import 'package:climaa/utilities/constants.dart';
import 'package:climaa/services/weather.dart';
import 'package:climaa/screens/loading_screen.dart';
import 'package:climaa/services/location.dart';
import 'package:climaa/screens/city_screen.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherpasses});
  final weatherpasses;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel theWeather = WeatherModel();

  String weathericon;
  String cityName;
  int temp;
  String message;
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherpasses);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temp = 0;
        weathericon = 'Error';
        message = 'can\'t get the weather';
        cityName = '';
      }
      int condNumber = weatherData['weather'][0]['id'];
      cityName = weatherData['name'];
      double temper = weatherData['main']['temp'];
      temp = temper.toInt();
      weathericon = theWeather.getWeatherIcon(condNumber);
      message = theWeather.getMessage(temp);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    onPressed: () async {
                      var currentweather = await theWeather.getWeatherUpdate();
                      updateUI(currentweather);
                      print('currentweather');
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  FlatButton(
                    onPressed: () async {
                      var tyepedname = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (tyepedname != null) {
                        var weatherData =
                            await WeatherModel().getCityWeather(tyepedname);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temp°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weathericon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
