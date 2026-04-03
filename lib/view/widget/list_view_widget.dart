import 'package:flutter/material.dart';
import 'package:flutter_pemula_project/model/google_office.dart';
import 'card_for_list_widget.dart';

class GoogleOfficeList extends StatelessWidget {
  const GoogleOfficeList({
    super.key,
    required this.listOfGoogleOffice,
    required this.onTap,
  });

  final List<GoogleOffice> listOfGoogleOffice;
  final Function(GoogleOffice) onTap;

  @override
  Widget build(BuildContext context) {
    if (listOfGoogleOffice.isEmpty) {
      return const Center(child: Text('Google office is not found!'));
    }

    return ListView.builder(
      itemCount: listOfGoogleOffice.length,
      itemBuilder: (context, index) {
        final googleOffice = listOfGoogleOffice[index];
        return GoogleOfficeCardForList(
          googleOffice: googleOffice,
          onTap: () => onTap(googleOffice),
        );
      },
    );
  }
}
