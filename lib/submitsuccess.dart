import 'package:flutter/material.dart';
import 'style_quiz_screen.dart';  // Import the Style Quiz Screen

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Success'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Data has been successfully written to Firestore!'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StyleQuizScreen()),
                );
              },
              child: Text('Go to Style Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
