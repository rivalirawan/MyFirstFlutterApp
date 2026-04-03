import 'package:flutter/material.dart';
import '../../model/google_office.dart';

class ImageContainerWidget extends StatelessWidget {
  const ImageContainerWidget({super.key, required this.googleOffice});

  final GoogleOffice googleOffice;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
