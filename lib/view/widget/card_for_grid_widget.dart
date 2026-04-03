import 'package:flutter/material.dart';
import 'package:flutter_pemula_project/model/google_office.dart';

class GoogleOfficeCardForGrid extends StatelessWidget {
  const GoogleOfficeCardForGrid({
    super.key,
    required this.googleOffice,
    required this.onTap,
  });

  final GoogleOffice googleOffice;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: .hardEdge,
      margin: .all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Image.network(
                fit: .cover,
                googleOffice.image,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(child: const CircularProgressIndicator());
                },
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: const Icon(Icons.error, color: Colors.red),
                  );
                },
              ),
            ),
            Padding(
              padding: const .all(16.0),
              child: Column(
                crossAxisAlignment: .start,
                mainAxisSize: .min,
                children: [
                  Text(
                    googleOffice.name,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  Text(googleOffice.address, maxLines: 1, overflow: .ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
