import 'package:flutter/material.dart';
import 'package:software_p/bottom_nav_bar.dart';

import 'package:software_p/ShopNow.dart';
//import 'package:software_p/bottom_nav_bar.dart';
//import 'package:software_p/custom_scalfold.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SingleChildScrollView(child: Text('MyCart'),),
      // showBottomNavBar: true,
      // initialIndex: 3,
      backgroundColor: const Color.fromARGB(255, 249, 240, 253),
      bottomNavigationBar: const BottomNavBar(
        initialIndex: 3,
      ),
      appBar: AppBar(
        title: const Text('My Bag'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              // Handle cart button press
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.shopping_bag_outlined, // Your icon
              size: 48.0, // Adjust the size of the icon
              color: Color.fromARGB(
                  255, 164, 144, 172), // Adjust the color of the icon
            ),
            const SizedBox(height: 16.0), // Add space between the icon and the text
            const Text(
              'YOUR CART IS EMPTY',
              style: TextStyle(
                fontSize: 16.0, // Adjust the font size of the text
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12.0),
             const Text(
              'You have no items in your cart \n  at the moment',
              style: TextStyle(
                fontSize: 16.0, // Adjust the font size of the text
                color: Color.fromARGB(255, 176, 175, 177),
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 200, // Adjust the width of the button
              height: 50, // Adjust the height of the button
              child: TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 251, 250, 252)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 202, 154, 236)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Adjust the border radius
                    ),
                  ),
                ),
                onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=> const ShopNow()));
                },
                child: const Text('Start Shopping'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
