import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestGuide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tour Guides'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: TourGuideProfile(),
      ),
    );
  }
}

class TourGuideProfile extends StatefulWidget {
  @override
  _TourGuideProfileState createState() => _TourGuideProfileState();
}

class _TourGuideProfileState extends State<TourGuideProfile> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _languagesController = TextEditingController();
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(
                  'https://via.placeholder.com/150'), // Placeholder image URL
            ),
            const SizedBox(height: 16),
            _buildEditableField('Name:', _nameController),
            _buildEditableField('Email:', _emailController),
            _buildEditableField('Contact Number:', _phoneController),
            _buildEditableField('Date of Birth:', _dobController),
            _buildEditableField('Languages:', _languagesController),
            _buildEditableField('Experience:', _experienceController),
            const SizedBox(height: 34),
            Text(
              'Additional Details',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildEditableField('Details:', _detailsController, maxLines: 5),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // Placeholder for save action
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.green,
              ),
              child: Text(
                'Save',
                style: GoogleFonts.poppins(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller,
      {int maxLines = 1}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            ),
            style: GoogleFonts.poppins(),
          ),
        ],
      ),
    );
  }
}
