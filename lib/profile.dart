import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_p/bottom_nav_bar.dart';

class profilePage extends StatelessWidget {
   final String username;
  const profilePage({Key? key, required this.username}) : super(key: key);
  //const profilePage({super.key});
static const String id = "profilePage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(
        initialIndex: 3,
      ),
      appBar: AppBar(
        title: const Text('Acount'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined),
            // Handle logout  button press
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setString('token',"null");
             Navigator.pushNamed(context, profilePage.id);
            },

              
            
          ),
        ],
      ),
      body:  Column( 
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding:
           const EdgeInsets.all(16.0),
            child: Text( 'Hi, $username',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              ),
               ListTile(
            title: Text('My Orders'),
            onTap: () {
              // Navigate to my orders page
            },),
            ListTile(
            title: Text('My Favorites'),
            onTap: () {
              // Navigate to my favorites page
            },
          ),
            
        ]
      )//hi+ getuserName
      
    );
  }
}