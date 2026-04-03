import 'package:flutter/material.dart';
import '../../model/google_office.dart';
import '../widget/image_container_widget.dart';
import '../widget/information_section_widget.dart';
import '../widget/map_widget.dart';

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
            ImageContainerWidget(googleOffice: googleOffice),
            InformationSectionWidget(googleOffice: googleOffice),
            MapWidget(googleOffice: googleOffice),
          ],
        ),
      ),
    );
  }
}
