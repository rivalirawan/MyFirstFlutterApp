import 'package:flutter/material.dart';
import 'package:flutter_pemula_project/view/home_page.dart';

class SubmissionApp extends StatelessWidget {
  const SubmissionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Pemula Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
