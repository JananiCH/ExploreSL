import 'package:exploresl_login/pages/colombo.dart';
import 'package:exploresl_login/pages/galle.dart';
import 'package:exploresl_login/pages/kandy.dart';
import 'package:exploresl_login/pages/nuwaraeliya.dart';
import 'package:exploresl_login/pages/polonnaruwa.dart';
import 'package:exploresl_login/pages/sigiriya.dart';
import 'package:exploresl_login/pages/udawalawa.dart';
import 'package:flutter/material.dart';

class ScreenA extends StatelessWidget {
  final List<String> imagePaths = [
    "lib/images/pictures_d/Kandy.png",
    "lib/images/pictures_d/nuwaraeliya.png",
    "lib/images/pictures_d/galle.png",
    "lib/images/pictures_d/colombo.png",
    "lib/images/pictures_d/polonnaruwa.png",
    "lib/images/pictures_d/sigiriya.png",
    "lib/images/pictures_d/udawalawa.png",
  ];

  final List<String> cityNames = [
    "Kandy",
    "Nuwara Eliya",
    "Galle",
    "Colombo",
    "Polonnaruwa",
    "Sigiriya",
    "Udawalawa",
  ];

  final List<Widget Function(BuildContext)> pageRoutes = [
    (context) => const Kandy(),
    (context) => const NuwaraEliya(),
    (context) => const galle(),
    (context) => const colombo(),
    (context) => const Polonnaruwa(),
    (context) => const Sigiriya(),
    (context) => const Udawalawa(),
  ];

  ScreenA({super.key});

  @override
  Widget build(BuildContext context) {
    const imageSize = Size(365, 200); // Set the desired image size

    return Scaffold(
      appBar: AppBar(
        title: const Text('Destinations'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: imagePaths.length,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedImageCard(
            imagePath: imagePaths[index],
            cityName: cityNames[index],
            pageRoute: pageRoutes[index],
            imageSize: imageSize,
          );
        },
      ),
    );
  }
}

class AnimatedImageCard extends StatefulWidget {
  final String imagePath;
  final String cityName;
  final Widget Function(BuildContext) pageRoute;
  final Size imageSize;

  const AnimatedImageCard({
    Key? key,
    required this.imagePath,
    required this.cityName,
    required this.pageRoute,
    required this.imageSize,
  }) : super(key: key);

  @override
  _AnimatedImageCardState createState() => _AnimatedImageCardState();
}

class _AnimatedImageCardState extends State<AnimatedImageCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  bool _isTapped = false;
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _loadImage();
  }

  void _loadImage() {
    // Simulate a network/image loading delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isLoaded = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
    setState(() {
      _isTapped = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    setState(() {
      _isTapped = false;
    });
  }

  void _onTapCancel() {
    _controller.reverse();
    setState(() {
      _isTapped = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: widget.pageRoute),
        );
      },
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _scaleAnimation,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: child,
              );
            },
            child: AnimatedOpacity(
              opacity: _isLoaded ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Container(
                width: widget.imageSize.width,
                height: widget.imageSize.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      spreadRadius: 1.0,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10), // Adjust the height of SizedBox as needed
          Text(
            widget.cityName,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20), // Additional space below the text
        ],
      ),
    );
  }
}
