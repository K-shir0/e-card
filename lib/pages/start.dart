import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Eカード", style: const TextStyle(fontSize: 40),),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/play'),
                child: Text("ゲームを始める"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
