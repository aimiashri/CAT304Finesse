import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:final_finesse/31_fitness_appointmentbooking.dart';
import 'package:get/get.dart';

class GoogleMapFlutter extends StatefulWidget {
  const GoogleMapFlutter({super.key});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();
}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {
  LatLng myCurrentLocation = const LatLng(5.352327, 100.298988);
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search location',
            border: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 15),
          ),
          onSubmitted: (value) async {
            List<Location> locations = await locationFromAddress(value);
            if (locations.isNotEmpty) {
              LatLng searchedLocation =
                  LatLng(locations.first.latitude, locations.first.longitude);
              googleMapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: searchedLocation,
                    zoom: 14,
                  ),
                ),
              );
              markers.clear();
              markers.add(
                Marker(
                  markerId: const MarkerId('searchedLocation'),
                  position: searchedLocation,
                ),
              );
              setState(() {});
            }
          },
        ),
        backgroundColor: Colors.white,
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        markers: markers,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: myCurrentLocation,
          zoom: 14,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.my_location,
          size: 30,
        ),
        onPressed: () async {
          // Navigate to AppointmentDone page
          Navigator.of(context).pop();
          Get.to(() => FitnessAppointmentBooking());
          Position position = await currentPosition();
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );
          markers.clear();
          markers.add(
            Marker(
              markerId: const MarkerId('currentLocation'),
              position: LatLng(position.latitude, position.longitude),
            ),
          );
          setState(() {});
        },
      ),
    );
  }

  Future<Position> currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}

// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geocoding/geocoding.dart';

// // Main widget for displaying Google Map
// class GoogleMapFlutter extends StatefulWidget {
//   const GoogleMapFlutter({super.key});

//   @override
//   State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();
// }

// class _GoogleMapFlutterState extends State<GoogleMapFlutter> {
//   // Initial location for the map's camera position (latitude and longitude)
//   LatLng myCurrentLocation = const LatLng(5.352327, 100.298988);
//   // LatLng myCurrentLocation = const LatLng(28.578382, 81.63359);

//   late GoogleMapController googleMapController;
//   Set<Marker> markers = {};

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         myLocationButtonEnabled: false,

//         markers: markers,
//         // Setting the controller when the map is created
//         onMapCreated: (GoogleMapController controller) {
//           googleMapController = controller;
//         },
//         // Initial camera position of the map
//         initialCameraPosition: CameraPosition(
//           target: myCurrentLocation,
//           zoom: 14,
//         ),
//       ),
//       // Floating action button to get user's current location
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.white,
//         child: const Icon(
//           Icons.my_location,
//           size: 30,
//         ),
//         onPressed: () async {
//           // Getting the current position of the user
//           Position position = await currentPosition();

//           // Animating the camera to the user's current position
//           googleMapController.animateCamera(
//             CameraUpdate.newCameraPosition(
//               CameraPosition(
//                 target: LatLng(position.latitude, position.longitude),
//                 zoom: 14,
//               ),
//             ),
//           );

//           // Clearing existing markers
//           markers.clear();
//           // Adding a new marker at the user's current position
//           markers.add(
//             Marker(
//               markerId: const MarkerId('currentLocation'),
//               position: LatLng(position.latitude, position.longitude),
//             ),
//           );

//           // Refreshing the state to update the UI with new markers
//           setState(() {});
//         },
//       ),
//     );
//   }

//   // Function to determine the user's current position
//   Future<Position> currentPosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;

//     // Checking if location services are enabled
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled');
//     }

//     // Checking the location permission status
//     permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied) {
//       // Requesting permission if it is denied
//       permission = await Geolocator.requestPermission();
//       if (permission == LocationPermission.denied) {
//         return Future.error("Location permission denied");
//       }
//     }

//     // Handling the case where permission is permanently denied
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied');
//     }

//     // Getting the current position of the user
//     Position position = await Geolocator.getCurrentPosition();
//     return position;
//   }
// }
