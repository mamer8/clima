import 'package:climaa/services/location.dart';
import 'package:climaa/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:climaa/services/networking.dart';
import 'package:climaa/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getWeatherUpdate();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(weatherpasses: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    // getLocation();
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 50.0,
        ),
      ),
      // body: Center(
      //   child: RaisedButton(
      //     onPressed: () async {
      //       LocationPermission permission;
      //       permission = await Geolocator.requestPermission();
      //       getLocation();
      //     },
      //     child: Text('Get Location'),
      //   ),
      // ),
    );
  }
}
