import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Define the FirestoreExample widget
class FirestoreExample extends StatelessWidget {
  const FirestoreExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        // Define the button press action
        onPressed: () async {
          try {
            // Attempt to write to Firestore
            await FirebaseFirestore.instance
                .collection('test') // Specify the collection name
                .doc('testDoc') // Specify the document ID
                .set({'field': 'value'}); // Set the document's data

            // Show a success message
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Document written successfully'))
            );

            // Navigate to the SuccessPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SuccessPage()),
            );
          } catch (e) {
            // Show an error message if the write fails
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Failed to write document: $e'))
            );
          }
        },
        child: const Text('Write to Firestore'), // Button label
      ),
    );
  }
}

// Define the SuccessPage widget to navigate to upon successful Firestore write
class SuccessPage extends StatelessWidget {
  const SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Success'),
      ),
      body: const Center(
        child: Text('Data has been successfully written to Firestore!'),
      ),
    );
  }
}
