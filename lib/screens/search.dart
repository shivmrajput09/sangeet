import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF121212),
      body: Center(
        child: Text(
          "Search Page (Design pending)",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}