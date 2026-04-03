import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/google_office.dart';

class InformationSectionWidget extends StatelessWidget {
  const InformationSectionWidget({super.key, required this.googleOffice});

  final GoogleOffice googleOffice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: .start,
      children: [
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
                    Expanded(child: Text(googleOffice.phone, textAlign: .left)),
                  ],
                ),
                Row(
                  spacing: 24.0,
                  children: [
                    Icon(Icons.location_searching, color: Colors.deepPurple),
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
      ],
    );
  }
}
