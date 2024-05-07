import 'package:flutter/material.dart';

class Sandeep extends StatelessWidget {
  const Sandeep({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tour Guides',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TourGuideProfile(),
    );
  }
}

class TourGuideProfile extends StatelessWidget {
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage('assets/sadun_profile.jpg'),
            ),
            const SizedBox(height: 16),
            const Text(
              'Sadun Bhagya',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('DOB: 1996/05/27'),
            const Text('Gender: Male'),
            const Text('Languages: English, Spanish'),
            const Text('Experience: 5 years'),
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
            const Text(
              'Hello, my name is Sadun and I am a licensed tour guide in Sri Lanka. '
              'I have been working as a tour guide for over 5 years and I love sharing '
              'my passion for this beautiful island with visitors from all over the world. '
              'I can offer you a variety of tours that suit your interests and preferences, '
              'whether you want to explore the rich cultural heritage, the stunning natural '
              'scenery, the diverse wildlife, or vibrant nightlife of Sri Lanka. I can also '
              'customize your itinerary according to your budget, time, and special requests.',
            ),
          ],
        ),
     ),);}
}