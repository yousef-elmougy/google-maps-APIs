import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyGoogleMap extends StatelessWidget {
  const MyGoogleMap(
      {super.key,
      required this.markers,
      required this.initialCameraPosition,
      required this.onMapCreated,
      required this.polyline});

  final Set<Marker> markers;
  final Set<Polyline> polyline;
  final CameraPosition initialCameraPosition;
  final MapCreatedCallback onMapCreated;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      markers: markers,
      initialCameraPosition: initialCameraPosition,
      onMapCreated: onMapCreated,
      polylines: polyline,
    );
  }
}
