import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Guides extends StatelessWidget {
  final List<String> imageUrls = [
    'lib/images/all/1.jpeg',
    'lib/images/all/2.jpeg',
    'lib/images/all/3.jpeg',
    'lib/images/all/4.jpeg',
    'lib/images/all/5.jpeg',
    'lib/images/all/6.jpeg',
    'lib/images/all/7.jpeg',
    'lib/images/all/8.jpeg',
  ];
  final List<String> imageUrls2 = [
    'lib/images/kandy/1.jpeg',
    'lib/images/kandy/2.jpeg',
    'lib/images/kandy/3.jpeg',
    'lib/images/kandy/4.jpeg',
    'lib/images/kandy/5.jpeg',
  ];
  final List<String> imageUrls3 = [
    'lib/images/galle/1.jpeg',
    'lib/images/galle/2.jpeg',
    'lib/images/galle/3.jpeg',
    'lib/images/galle/4.jpeg',
    'lib/images/galle/5.jpeg',
  ];

  Guides({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tour Guides',
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'All around Sri Lanka',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Tour guides in this section will guide tourists who would like to travel all around Sri Lanka during their stay.',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrls.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: AssetImage(imageUrls[index]),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more ➤',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Specific Regions',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Tour guides in these sections will guide tourists who prefer to explore specific regions only.',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Kandy',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrls2.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: AssetImage(imageUrls2[index]),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more ➤',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Galle',
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageUrls3.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        radius: 38,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: AssetImage(imageUrls3[index]),
                      ),
                    );
                  },
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more ➤',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
