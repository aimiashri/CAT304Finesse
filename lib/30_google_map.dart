import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:final_finesse/31_trainer_info.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapFlutter extends StatefulWidget {
  const GoogleMapFlutter({super.key});

  @override
  State<GoogleMapFlutter> createState() => _GoogleMapFlutterState();
}

class _GoogleMapFlutterState extends State<GoogleMapFlutter> {
  LatLng myCurrentLocation = const LatLng(5.3575, 100.3014); // USM Penang
  late GoogleMapController googleMapController;
  Set<Marker> markers = {};
  List<FitnessCenter> fitnessCenters = [
    FitnessCenter(
      name: 'USM Fitness Centre',
      location: LatLng(5.356327, 100.302988),
      rating: 5.0,
    ),
    FitnessCenter(
      name: 'Zender Fitness',
      location: LatLng(5.353327, 100.299988),
      rating: 4.5,
    ),
    FitnessCenter(
      name: 'Seven Star Fitness',
      location: LatLng(5.350327, 100.300988),
      rating: 4.0,
    ),
    FitnessCenter(
      name: 'Orient Fitness',
      location: LatLng(5.353327, 100.301988),
      rating: 4.8,
    ),
    FitnessCenter(
      name: 'Anytime Fitness Penang',
      location: LatLng(5.351327, 100.303988),
      rating: 4.6,
    ),
  ];

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadFitnessCenters();
  }

  void _loadFitnessCenters() async {
    for (var center in fitnessCenters) {
      double distance = await _calculateDistance(myCurrentLocation, center.location);
      center.distance = distance;
      markers.add(
        Marker(
          markerId: MarkerId(center.name),
          position: center.location,
          infoWindow: InfoWindow(
            title: center.name,
            snippet: 'Rating: ${center.rating}, Distance: ${center.distance.toStringAsFixed(2)} km',
            onTap: () {
              _showFitnessCenterInfo(center);
            },
          ),
        ),
      );
    }
    setState(() {});
  }

  Future<double> _calculateDistance(LatLng start, LatLng end) async {
    return Geolocator.distanceBetween(start.latitude, start.longitude, end.latitude, end.longitude) / 1000;
  }

  void _showFitnessCenterInfo(FitnessCenter center) {
    Get.to(() => TrainerInfo(centerName: center.name));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fitness Centres',
          style: TextStyle(color: Color(0xFFE2F163)),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: GoogleMap(
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
            ),
            Expanded(
              flex: 1,
              child: DraggableScrollableSheet(
                initialChildSize: 1.0,
                minChildSize: 0.1,
                maxChildSize: 1.0,
                builder: (context, scrollController) {
                  return Container(
                    color: Colors.black,
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: ClampingScrollPhysics(),
                      itemCount: fitnessCenters.length,
                      itemBuilder: (context, index) {
                        final center = fitnessCenters[index];
                        return Card(
                          color: const Color(0xFF896CFE),
                          margin: EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: Icon(Icons.fitness_center),
                            title: Text(center.name),
                            titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            subtitleTextStyle: TextStyle(color: Colors.black),
                            subtitle: Text('Rating: ${center.rating}, Distance: ${center.distance.toStringAsFixed(2)} km'),
                            onTap: () {
                              _showFitnessCenterInfo(center);
                            },
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FitnessCenter {
  final String name;
  final LatLng location;
  final double rating;
  double distance;

  FitnessCenter({
    required this.name,
    required this.location,
    required this.rating,
    this.distance = 0.0,
  });
}