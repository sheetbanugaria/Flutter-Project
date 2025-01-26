import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('About Us'),
        ),
        body: Center(
          child: Text('About Us Screen'),
        ),
      ),
    );
  }
}
