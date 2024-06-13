import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactNowPage extends StatelessWidget {
  final String guidePhoneNumber;

  const ContactNowPage({
    Key? key,
    required this.guidePhoneNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Guide Contact',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Guide\'s Contact Number:',
              style: GoogleFonts.lato(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () => _launchPhoneCall(guidePhoneNumber),
              child: Text(
                guidePhoneNumber,
                style: GoogleFonts.lato(
                  fontSize: 18,
                  color:
                      Colors.blue, // Change text color to blue for indication
                  decoration:
                      TextDecoration.underline, // Add underline decoration
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchPhoneCall(String phoneNumber) async {
    String url = 'tel:$phoneNumber';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
