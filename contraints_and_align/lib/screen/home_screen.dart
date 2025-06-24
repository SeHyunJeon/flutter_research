import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.red,
          child: Align(
            alignment: Alignment(0.5, 0.7),
            child: Container(width: 50.0, height: 50.0, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
