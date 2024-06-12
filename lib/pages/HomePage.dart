import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exploresl_login/pages/ScreenA.dart';
import 'package:exploresl_login/pages/guides.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/guide_model.dart';
import 'GuideProfile.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myCurrentIndex = 0;

  final List<String> imageUrls4 = [
    'lib/images/places/place1.jpeg',
    'lib/images/places/place2.jpeg',
    'lib/images/places/place3.jpeg',
  ];

  final List<String> imageUrls5 = [
    'lib/images/destinations/galle.jpeg',
    'lib/images/destinations/kandy.jpg',
    'lib/images/destinations/trinco.jpg',
    'lib/images/destinations/nuwaraeliya.jpeg',
    'lib/images/destinations/jaffna.jpg',
    'lib/images/destinations/matale.jpeg',
  ];

  Stream<List<Guide>> getAllUsers() async* {
    final usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      final snapshot = usersCollection.snapshots();

      yield* snapshot.map((event) {
        final list = event.docs.where((element) {
          return element["type"] == "guide";
        });
        return list.map((e) => Guide.fromMap(e.data())).toList();
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueAccent,
        title: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('lib/images/galle/5.jpeg'),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome to ExploreSL,',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Discover Sri Lanka with ease',
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.blue.shade50],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search for places or guides",
                      hintStyle: GoogleFonts.poppins(),
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.grey.shade300,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.blue.shade500,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Top Rated Experiences',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 220,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      height: 220,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayInterval: const Duration(seconds: 4),
                      enlargeCenterPage: true,
                      aspectRatio: 16 / 9,
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      },
                    ),
                    items: imageUrls4.map((url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: screenWidth,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(url, fit: BoxFit.cover),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 20), // Added space here
                AnimatedSmoothIndicator(
                  activeIndex: myCurrentIndex,
                  count: imageUrls4.length,
                  effect: const WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      dotColor: Colors.grey,
                      spacing: 5,
                      activeDotColor: Colors.blue),
                ),
                const SizedBox(height: 10),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Top Destinations',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenA(),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageUrls5.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 38,
                            backgroundImage: AssetImage(imageUrls5[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenA(),
                        ),
                      );
                    },
                    child: const Text(
                      'See more ➤',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Top Guides',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black87),
                    ),
                  ),
                ),
                StreamBuilder(
                  stream: getAllUsers(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Error: ${snapshot.error}");
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }
                    if (snapshot.hasData) {
                      final List<Guide>? users = snapshot.data;
                      return SizedBox(
                        height: 100,
                        child: ListView.builder(
                          itemCount: users?.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TourGuideProfile(
                                      guide: users[index],
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipOval(
                                  child: Image.network(
                                    users![index].image,
                                    width: 75,
                                    height: 75,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Guides(),
                        ),
                      );
                    },
                    child: const Text(
                      'See more ➤',
                      style: TextStyle(fontSize: 15, color: Colors.blue),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
