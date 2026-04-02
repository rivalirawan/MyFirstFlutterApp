import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import '../model/google_office.dart';

class DetailPage extends StatelessWidget {
  final GoogleOffice googleOffice;
  final String? googleOfficeId;

  DetailPage({super.key, GoogleOffice? googleOffice, this.googleOfficeId})
    : googleOffice = listOfGoogleOffice.firstWhere(
        (office) => office.id == googleOfficeId,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('DetailPage'),
      ),
      // TODO 2: change the widget below and add the selected Google office details
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Container(
              margin: const .all(16.0),
              decoration: BoxDecoration(
                borderRadius: .circular(16.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: .circular(16.0),
                child: Image.network(googleOffice.image, fit: .cover),
              ),
            ),
            Padding(
              padding: const .symmetric(vertical: 8.0),
              child: Text(
                'Google ${googleOffice.name}',
                textAlign: .center,
                style: GoogleFonts.oswald(fontSize: 30.0, fontWeight: .w400),
              ),
            ),
            Padding(
              padding: const .symmetric(horizontal: 32.0, vertical: 8.0),
              child: DefaultTextStyle(
                style: GoogleFonts.poppins(color: Colors.black),
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 16.0,
                  children: [
                    Row(
                      spacing: 24.0,
                      children: [
                        Icon(Icons.location_on, color: Colors.deepPurple),
                        Expanded(
                          child: Text(googleOffice.address, textAlign: .left),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 24.0,
                      children: [
                        Icon(Icons.domain, color: Colors.deepPurple),
                        Expanded(
                          child: Text(googleOffice.region, textAlign: .left),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 24.0,
                      children: [
                        Icon(Icons.phone, color: Colors.deepPurple),
                        Expanded(
                          child: Text(googleOffice.phone, textAlign: .left),
                        ),
                      ],
                    ),
                    Row(
                      spacing: 24.0,
                      children: [
                        Icon(
                          Icons.location_searching,
                          color: Colors.deepPurple,
                        ),
                        Expanded(
                          child: Text(
                            'lat: ${googleOffice.lat}, lng: ${googleOffice.lng}',
                            textAlign: .left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 300.0,
              child: Padding(
                padding: const .all(16.0),
                child: Stack(
                  children: [
                    FlutterMap(
                      options: MapOptions(
                        initialCenter: LatLng(
                          googleOffice.lat,
                          googleOffice.lng,
                        ),
                        initialZoom: 14.0,
                        interactionOptions: const InteractionOptions(
                          flags: InteractiveFlag.none,
                        ),
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName:
                              'com.example.flutter_pemula_project',
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(googleOffice.lat, googleOffice.lng),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
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
            ),
          ],
        ),
      ),
    );
  }
}
