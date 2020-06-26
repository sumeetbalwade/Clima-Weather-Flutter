import 'package:geolocator/geolocator.dart';

class Location {
  double lat;
  double longitude;

  Future<void> getLocation() async {
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.lowest);
    lat = position.latitude;
    this.longitude = position.longitude;
  }
}
