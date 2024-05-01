import 'package:flutter/material.dart';

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

  const Guides({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Tour Guides',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'All around SL',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
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
                  child: const Text(
                    'See more ➤',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Specific Regions',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Kandy',
                  style: TextStyle(fontSize: 15),
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
                  child: const Text(
                    'See more ➤',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Galle',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
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
                  child: const Text(
                    'See more ➤',
                    style: TextStyle(fontSize: 16),
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
