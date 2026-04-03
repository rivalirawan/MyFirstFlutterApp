import 'package:flutter/material.dart';
import 'package:flutter_pemula_project/model/google_office.dart';
import 'card_for_grid_widget.dart';

class GoogleOfficeGrid extends StatelessWidget {
  const GoogleOfficeGrid({
    super.key,
    required this.gridOfGoogleOffice,
    required this.onTap,
  });

  final List<GoogleOffice> gridOfGoogleOffice;
  final Function(GoogleOffice) onTap;

  @override
  Widget build(BuildContext context) {
    if (gridOfGoogleOffice.isEmpty) {
      return const Center(child: Text('Google office is not found!'));
    }

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 350.0,
        childAspectRatio: 0.8,
      ),
      itemCount: gridOfGoogleOffice.length,
      itemBuilder: (context, index) {
        final googleOffice = gridOfGoogleOffice[index];
        return GoogleOfficeCardForGrid(
          googleOffice: googleOffice,
          onTap: () => onTap(googleOffice),
        );
      },
    );
  }
}
