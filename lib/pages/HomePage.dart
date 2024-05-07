import 'dart:async';
import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exploresl_login/pages/ScreenA.dart';
import 'package:exploresl_login/pages/choose_user.dart';
import 'package:exploresl_login/pages/destinations.dart';
import 'package:exploresl_login/pages/guides.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

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

  Stream<List<User>> getAllUsers() async* {
    final usersCollection = FirebaseFirestore.instance.collection('users');

    try {
      final snapshot = usersCollection.snapshots();

      yield* snapshot.map((event) {
        final list = event.docs.where((element) {
          return element["type"] == "guide";
        });
        return list.map((e) => User.fromMap(e.data())).toList();
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
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
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.search_sharp,
                      size: 36,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search for places or guides",
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
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                      onPageChanged: (index, reason) {
                        setState(() {
                          myCurrentIndex = index;
                        });
                      },
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
                      builder: (context) => Guides(),
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
             // GestureDetector(
//   onTap: () {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => TourGuideProfile(),
//       ),
//     );
//   },
// ),

StreamBuilder(
  stream: getAllUsers(),
  builder: (context, snapshot) {
    if (snapshot.hasError) {
      return Text("Error: ${snapshot.error}");
    }
    if (snapshot.connectionState == ConnectionState.waiting) {
      return CircularProgressIndicator();
    }
    if (snapshot.hasData) {
      final List<User>? users = snapshot.data;
      return SizedBox(
        height: 100,
        child: ListView.builder(
          itemCount: users?.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector( // Wrap the Image in a GestureDetector for navigation
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TourGuideProfile(), // Replace with your guide profile page
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(users![index].image),
                ),
              ),
            );
          },
        ),
      );
    }
    return CircularProgressIndicator(); // Return a loading indicator while waiting for data
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
            ],
          ),
        ),
      ),
    );
  }
}
