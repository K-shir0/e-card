import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
        onPressed: () => Navigator.pushNamed(context, '/play'),
        child: Text("test"),
      ),
    );
  }
}
