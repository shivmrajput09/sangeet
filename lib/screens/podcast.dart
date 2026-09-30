import 'package:flutter/material.dart';

class PodcastScreen extends StatelessWidget {
  const  PodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF121212),
      body: Center(
        child: Text(
          "podcast Page (Design pending)",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}