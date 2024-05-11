/*import 'package:flutter/material.dart';
import '../models/tourist_model.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Tourist Profile'),
        actions: [
          TextButton(
            onPressed: () {
              // Save profile changes
            },
            child: const Text('Save'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Center(),
          const SizedBox(height: 24),
          ListTile(
            title:  const Text('NAME'),
            subtitle:  Text(Tourist.name),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Edit name
            },
          ),
          ListTile(
            title: const Text('EMAIL'),
            subtitle:  Text(Tourist.email),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Edit email
            },
          ),
          ListTile(
            title: const Text('TITLE'),
            subtitle: const Text('Principal Product Designer'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Edit title
            },
          ),
          ListTile(
            title: const Text('country'),
            subtitle: Text(Tourist.country),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Edit location
            },
          ),
          ListTile(
            title: const Text('mobile number'),
            subtitle: const Text('+94 600 0271'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {}, //Edit number
          ),
        ],
      ),
    );
  }
}
*/