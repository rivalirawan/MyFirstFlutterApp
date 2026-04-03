import 'package:flutter/material.dart';
import '../model/google_office.dart';
import 'page/detail_page.dart';
import '../view/widget/grid_view_widget.dart';
import '../view/widget/list_view_widget.dart';
import '../view/widget/search_field_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<GoogleOffice> filteredListOfGoogleOffice = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredListOfGoogleOffice = List.from(listOfGoogleOffice);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('HomePage'),
      ),
      // TODO 1: change the widget below and add a Google office list
      body: Column(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 900),
              child: Padding(
                padding: const .all(8.0),
                child: SearchField(
                  controller: _controller,
                  onChanged: (value) {
                    setState(() {
                      _filterGoogleOffice(value);
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 700) {
                  return Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 900),
                      child: GoogleOfficeGrid(
                        gridOfGoogleOffice: filteredListOfGoogleOffice,
                        onTap: _handleCardTap,
                      ),
                    ),
                  );
                } else {
                  return GoogleOfficeList(
                    listOfGoogleOffice: filteredListOfGoogleOffice,
                    onTap: _handleCardTap,
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDetailPage(BuildContext context, String googleOfficeId) {
    // TODO 3: edit this function to navigate to DetailPage
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            DetailPage(googleOfficeId: googleOfficeId),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          var offsetAnimation = animation.drive(tween);

          return SlideTransition(position: offsetAnimation, child: child);
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }

  void _handleCardTap(GoogleOffice googleOffice) {
    _navigateToDetailPage(context, googleOffice.id);
  }

  void _filterGoogleOffice(String query) {
    final lowerQuery = query.toLowerCase();

    filteredListOfGoogleOffice = listOfGoogleOffice.where((office) {
      final name = office.name.toLowerCase();
      final address = office.address.toLowerCase();

      return name.contains(lowerQuery) || address.contains(lowerQuery);
    }).toList();
  }
}
