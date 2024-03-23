import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Home Page'),
      ),
      body: const Center(
        child: Text(
          'Welcome to My Home Page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
