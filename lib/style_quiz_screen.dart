import 'package:flutter/material.dart';

class StyleQuizScreen extends StatefulWidget {
  @override
  _StyleQuizScreenState createState() => _StyleQuizScreenState();
}

class _StyleQuizScreenState extends State<StyleQuizScreen> {
  String? _selectedStyle;

  final List<String> styles = [
    'K-Drama Core',
    'Croquette Core',
    'Lana Del Rey Core',
    'Taylor Swift Core',
    'Vintage Core',
    'Streetwear Core',
    'Boho Core',
    'Minimalist Core',
  ];

  void _submitStyle() {
    if (_selectedStyle != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You have selected $_selectedStyle style!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a style'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Style Quiz'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select your preferred fashion style:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Column(
              children: styles.map((style) {
                return RadioListTile<String>(
                  title: Text(style),
                  value: style,
                  groupValue: _selectedStyle,
                  onChanged: (value) {
                    setState(() {
                      _selectedStyle = value;
                    });
                  },
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _submitStyle,
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                'Submit',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
