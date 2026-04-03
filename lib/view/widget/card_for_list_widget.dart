import 'package:flutter/material.dart';
import 'package:flutter_pemula_project/model/google_office.dart';

class GoogleOfficeCardForList extends StatelessWidget {
  const GoogleOfficeCardForList({
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
      margin: .all(4.0),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: .start,
          spacing: 8.0,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                fit: .cover,
                height: 72.0,
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
            Expanded(
              flex: 3,
              child: Padding(
                padding: const .symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: .start,
                  spacing: 8.0,
                  children: [
                    Text(
                      googleOffice.name,
                      style: const TextStyle(fontSize: 16.0),
                    ),
                    Text(
                      googleOffice.address,
                      maxLines: 1,
                      overflow: .ellipsis,
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
