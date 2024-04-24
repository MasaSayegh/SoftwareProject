import 'package:flutter/material.dart';
import 'package:software_p/login.dart';
//import 'package:software_p/main.dart';
import 'package:software_p/HomeScreen.dart';

import 'package:software_p/ShopNow.dart';
import 'package:software_p/MyCart.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;
  const BottomNavBar({super.key, required this.initialIndex});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var _selectedindex = 0;
  @override
  void initState() {
    super.initState();
    _selectedindex = widget.initialIndex;
  }

  void _onItemtapped(int index) {
    setState(() {
      _selectedindex = index;
    });
    switch (index) {
      case 0:
        _navigateToRoute(context, '/Home', const HomeScreen());
        break;
      case 1:
        _navigateToRoute(context, '/ShopNow', const ShopNow());
        break;
      case 2:
        _navigateToRoute(context, '/Acount', loginPage());
        break;
      case 3:
        _navigateToRoute(context, '/Cart', const MyCart());
        break;
    }
  }

  void _navigateToRoute(context, String routeName, Widget screen) {
    final String? currentRouteName = ModalRoute.of(context)?.settings.name;
    bool routeExists = currentRouteName == routeName;
    if (routeExists) {
      Navigator.popUntil(context, ModalRoute.withName(routeName));
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => screen,
          settings: RouteSettings(name: routeName),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: _selectedindex,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemtapped,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(255, 56, 56, 56),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
                color: _selectedindex == 0
                    ? const Color.fromARGB(255, 164, 144, 172)
                    : const Color.fromARGB(255, 56, 56, 56),
              ),
              label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shop_two_outlined,
                color: _selectedindex == 1
                    ? const Color.fromARGB(255, 164, 144, 172)
                    : const Color.fromARGB(255, 56, 56, 56),
              ),
              label: 'Shop Now'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_2_outlined,
                color: _selectedindex == 2
                    ? const Color.fromARGB(255, 164, 144, 172)
                    : const Color.fromARGB(255, 56, 56, 56),
              ),
              label: 'Account'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: _selectedindex == 3
                    ? const Color.fromARGB(255, 164, 144, 172)
                    : const Color.fromARGB(255, 56, 56, 56),
              ),
              label: 'cart'),
        ]);
  }
}
