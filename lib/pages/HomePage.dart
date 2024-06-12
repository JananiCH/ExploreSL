import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exploresl_login/pages/ScreenA.dart';
import 'package:exploresl_login/pages/choose_user.dart';
import 'package:exploresl_login/pages/guides.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/guide_model.dart';
import '../models/tourist_model.dart';
import '../models/user_model.dart';
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 169, 228, 241),
        automaticallyImplyLeading: false,
        title: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('lib/images/galle/5.jpeg'),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to ExploreSL,',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Discover Sri Lanka with ease',
                          style: TextStyle(
                            color: Colors.grey,
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.search_sharp, size: 24),
                    Padding(padding: EdgeInsets.only(right: 16)),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for places or guides",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
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
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: SizedBox(
                height: 300,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 200,
                    autoPlayCurve: Curves.fastOutSlowIn,
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayInterval: const Duration(seconds: 4),
                    enlargeCenterPage: true,
                    aspectRatio: 7.0,
                  ),
                  items: imageUrls4.map((url) => Image.asset(url)).toList(),
                ),
              ),
            ),
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
            const SizedBox(height: 5),
            const Row(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Top Destinations',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
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
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Top Guides',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
                          // Wrap the Image in a GestureDetector for navigation
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TourGuideProfile(
                                  guide: users[index],
                                ), // Replace with your guide profile page
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
                            )),
                          ),
                        );
                      },
                    ),
                  );
                }
                return const CircularProgressIndicator(); // Return a loading indicator while waiting for data
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
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
