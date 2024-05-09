// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exploresl_login/models/guide_model.dart';
import 'package:exploresl_login/pages/guides.dart';
import 'package:flutter/material.dart';

class TourGuideProfile extends StatelessWidget {
  final Guide guide;
  const TourGuideProfile({
    Key? key,
    required this.guide,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour Guides'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Handle navigation back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: NetworkImage(guide.image),
              ),
              const SizedBox(height: 16),
              Text(
                guide.name,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(guide.email),
              Text(guide.phoneNumber),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Handle "Contact Now" button press
                },
                child: const Text('Contact Now'),
              ),
              const SizedBox(height: 24),
              const Text(
                'About me',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                guide.additionalDetails,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
