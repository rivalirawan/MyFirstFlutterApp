import 'package:flutter/material.dart';
import '../model/google_office.dart';
import '../view/detail_page.dart';

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
                child: TextField(
                  controller: _controller,
                  keyboardType: .text,
                  obscureText: false,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Write google office name or address...',
                    labelText: 'Find Google Office',
                  ),
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

  void navigateToDetailPage(BuildContext context, String googleOfficeId) {
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
    navigateToDetailPage(context, googleOffice.id);
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

class GoogleOfficeCard extends StatelessWidget {
  const GoogleOfficeCard({
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
        return GoogleOfficeCard(
          googleOffice: googleOffice,
          onTap: () => onTap(googleOffice),
        );
      },
    );
  }
}

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
