//import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:software_p/homeAppBar.dart';
import 'package:software_p/bottom_nav_bar.dart';
import 'package:software_p/profile.dart';
import 'package:software_p/signup.dart';
import 'package:http/http.dart' as http;

//import 'package:software_p/signup.dart';
//import 'package:login_signup_screen/login.dart';
//import 'package:login_signup_screen/signup.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: loginPage(),
      routes: {loginSection.id: (context) => loginSection()}));
}

// ignore: camel_case_types, use_key_in_widget_constructors, must_be_immutable
class loginPage extends StatelessWidget {
  double getSmallDi(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDi(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  var email = '';
  var password = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 240, 253),
      bottomNavigationBar: const BottomNavBar(
        initialIndex: 2,
      ),
      body: Stack(
        children: [
          Positioned(
            right: -getSmallDi(context) / 3,
            top: -getSmallDi(context) / 3,
            child: Container(
              width: getSmallDi(context),
              height: getSmallDi(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFFbdc1df),
                      Color(0xffE7DAF3),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
            ),
          ),
          Positioned(
            left: -getBigDi(context) / 4,
            top: -getBigDi(context) / 4,
            child: Container(
              width: getBigDi(context),
              height: getBigDi(context),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xffE7DAF3),
                      Color.fromRGBO(189, 193, 223, 1)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
            ),
          ),
          Positioned(
            right: -getBigDi(context) / 2,
            bottom: -getBigDi(context) / 2,
            child: Container(
              width: getBigDi(context),
              height: getBigDi(context),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(255, 233, 224, 238),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 480,
                width: 560,
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Hello, \n Welcome To Aroura",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 164, 144, 172),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // mainAxisAlignment: MainAxisAlignment.center,
                    //  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        onChanged: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIconColor: Color.fromARGB(255, 164, 144, 172),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 164, 144, 172),
                              fontSize: 10),
                          // border: OutlineInputBorder(),
                          //border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                          iconColor: Color.fromRGBO(222, 224, 238, 1),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIconColor: Color.fromARGB(255, 164, 144, 172),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 164, 144, 172),
                              fontSize: 10),
                          //  border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.password),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          password =
                              value; // Assign the updated value to the password variable
                        },
                      ),
                    ),
                    const SizedBox(
                        height:
                            20), // Add some space between the text field and the link

                    const SizedBox(height: 10),
                    // child: Text('Login'),
                    ElevatedButton(
                      onPressed: () async {
                        print("now \n");
                        print(email);
                        print(password);
                        login(email, password);
                        //Navigator.pushNamed(context, loginSection.id);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String? token = prefs.getString("token");
                        print(token);
                        if (token != null) {
                          Navigator.pushNamed(context, loginSection.id);
                         Navigator.push(
                            context,  MaterialPageRoute(builder: (context) => profilePage( username: email,)));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 60),
                        backgroundColor: const Color.fromARGB(
                            255, 164, 144, 172), // Adjust button size
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(

                            //fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          // Implement the action for the "Forgot Password?" link
                        },
                        child: const Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Color.fromARGB(255, 164, 144, 172),
                          ),
                        ),
                      ),
                    ),
                    // const SizedBox(height: 10),
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 10.0, // Adjust the font size of the text
                        color: Color.fromARGB(255, 176, 175, 177),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                          // Implement the action for the "Forgot Password?" link
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => signupPage()));
                        },
                        child: const Text(
                          'create account',
                          style: TextStyle(
                            color: Color.fromARGB(255, 164, 144, 172),
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

login(email, password) async {
  var url = Uri.parse("http://192.168.2.13:5000/login");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
    }),
  );
  print(response.body);
  var parse = jsonDecode(response.body);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', parse["token"]);
  if (response.statusCode == 200) {
    print('login successful');
  } else {
    print('Error: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

class loginSection extends StatelessWidget {
  static const String id = "loginSection";
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
            child: Text( 'Hi',
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
