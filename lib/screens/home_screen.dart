import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Hello User'),),
      body: Column(
        children: [
          Text('Welcome to 360 app')
        ],
      ),
    );
  }
}
