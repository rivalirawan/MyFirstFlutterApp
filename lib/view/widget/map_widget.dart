import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../model/google_office.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key, required this.googleOffice});

  final GoogleOffice googleOffice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.0,
      child: Padding(
        padding: const .all(16.0),
        child: Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(googleOffice.lat, googleOffice.lng),
                initialZoom: 14.0,
                interactionOptions: const InteractionOptions(
                  flags: InteractiveFlag.none,
                ),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  userAgentPackageName: 'com.example.flutter_pemula_project',
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(googleOffice.lat, googleOffice.lng),
                      child: const Icon(Icons.location_on, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              top: 8.0,
              right: 8.0,
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: .all(8.0),
                  child: Text(
                    'OpenStreetMap',
                    textAlign: .center,
                    style: TextStyle(fontWeight: .bold, fontSize: 16.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
