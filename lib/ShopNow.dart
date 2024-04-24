import 'package:flutter/material.dart';
import 'package:software_p/bottom_nav_bar.dart';
//import 'package:software_p/bottom_nav_bar.dart';
//import 'package:software_p/custom_scalfold.dart';

class ShopNow extends StatelessWidget {
  const ShopNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(
        initialIndex: 1,
      ),
      appBar: AppBar(
        title: const Text('Shop Now'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 241, 240, 240),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const TextField(
                textAlign: TextAlign.center, // Align text to center
                style: TextStyle(
                    color: Color.fromARGB(
                        255, 214, 212, 212)), // Change text color
                decoration: InputDecoration(
                  hintText: 'Search products',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            ShopNowItem(
                imageUrl: 'images/makeup6.jpg',
                overlayText: 'makeup',
                onTap: () {
                  // Navigate to page for the first image
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FirstImagePage()));
                }),
            const SizedBox(height: 10.0),
            ShopNowItem(
                imageUrl: 'images/skincare1.jpg',
                overlayText: 'skincare',
                onTap: () {
                  // Navigate to page for the second image
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SecondImagePage()));
                }),
            const SizedBox(height: 10.0),
            ShopNowItem(
                imageUrl: 'images/gift1.jpg',
                overlayText: 'gift sets & kits',
                onTap: () {
                  // Navigate to page for the third image
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const ThirdImagePage()));
                }),
            const SizedBox(height: 10.0),
            ShopNowItem(
                imageUrl: 'images/haricare3.jpg',
                overlayText: 'hair',
                onTap: () {
                  // Navigate to page for the third image
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const FourImagePage()));
                }),
            const SizedBox(height: 10.0),
            ShopNowItem(
                imageUrl: 'images/bestone.jpg',
                overlayText: 'bestsellars',
                onTap: () {
                  // Navigate to page for the third image
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const fiveImagePage()));
                }),
          ],
        ),
      ),
    );
  }
}

class ShopNowItem extends StatelessWidget {
  final String imageUrl;
  final VoidCallback onTap;
  final String overlayText;
  final double width;
  final double height;

  const ShopNowItem({super.key, 
    required this.imageUrl,
    required this.overlayText,
    required this.onTap,
    this.width = 500, // Default width
    this.height = 200,
    // this.margin= const EdgeInsets.fromLTRB(30, 10, 30, 10),
    //  this.padding = const EdgeInsets.fromLTRB(20, 0, 10, 0),
  }); // Default height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: const Color.fromARGB(0, 243, 241, 241), // Set the color to transparent
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9.0)),
        margin: const EdgeInsets.fromLTRB(12, 10, 12, 0),
        //padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.circular(9.0), // Adjust the border radius here
              ),
              child: Image.asset(
                imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 120.0,
              ),
            ),
            Positioned(
              bottom: 30.0,
              child: Text(
                overlayText,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 23.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstImagePage extends StatelessWidget {
  const FirstImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('First Image Page Content'),
      ),
    );
  }
}

class SecondImagePage extends StatelessWidget {
  const SecondImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Second Image Page Content'),
      ),
    );
  }
}

class ThirdImagePage extends StatelessWidget {
  const ThirdImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('Third Image Page Content'),
      ),
    );
  }
}

class FourImagePage extends StatelessWidget {
  const FourImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('four Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('four Image Page Content'),
      ),
    );
  }
}

class fiveImagePage extends StatelessWidget {
  const fiveImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('five Image'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('five Image Page Content'),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ShopNow(),
  ));
}
