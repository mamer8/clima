import 'package:geolocator/geolocator.dart';

class Location {
  double latitude, longitude;
  Future<void> getcurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      // latitude = 30.6269187358;
      //longitude = 31.0139565194;

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
