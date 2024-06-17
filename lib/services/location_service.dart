import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationService {
  Future<Position> getCurrentLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw Exception('Location services are disabled.');
      }

      // Request location permissions using permission_handler
      PermissionStatus permissionStatus =
          await Permission.locationWhenInUse.request();
      if (permissionStatus != PermissionStatus.granted) {
        throw Exception('Location permissions are denied.');
      }

      // Get the current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      return position;
    } catch (e) {
      throw Exception('Failed to get current location: $e');
    }
  }
}
