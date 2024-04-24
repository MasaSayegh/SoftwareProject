//import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_p/bottom_nav_bar.dart';
import 'package:software_p/login.dart';
import 'package:http/http.dart' as http;
import 'package:software_p/profile.dart';
//import 'package:login_signup_screen/login.dart';
//import 'package:login_signup_screen/signup.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: signupPage(),
      routes: {
        landingScreen.id: (context) =>
            landingScreen(), // Define the landingScreen route
      },
      onUnknownRoute: (settings) {
        // Handle unknown routes here
        return MaterialPageRoute(
            builder: (_) => profilePage(
                  username: '',
                ));
      },
    ),
  );
}

// ignore: camel_case_types, use_key_in_widget_constructors, must_be_immutable
class signupPage extends StatelessWidget {
  var email = '';
  var password = '';
  var firstName = '';
  var secondName = '';

  double getSmallDi(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBigDi(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;
  @override
  Widget build(BuildContext context) {
    checkToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString("token");
      print(token);
      if (token != null) {
        Navigator.pushNamed(context, landingScreen.id);
      }
    }

    checkToken();
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
                color: Color(0xfff3e9ee),
              ),
            ),
          ),
          Positioned(
            top: 150,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 530,
                width: 400,
                margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                padding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Let's Get Started !",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 164, 144, 172),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // mainAxisAlignment: MainAxisAlignment.center,
                    //  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          prefixIconColor: Color.fromARGB(255, 164, 144, 172),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 164, 144, 172),
                              fontSize: 10),
                          // border: OutlineInputBorder(),
                          //border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          iconColor: Color.fromRGBO(222, 224, 238, 1),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          firstName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Second Name',
                          prefixIconColor: Color.fromARGB(255, 164, 144, 172),
                          labelStyle: TextStyle(
                              color: Color.fromARGB(255, 164, 144, 172),
                              fontSize: 10),
                          // border: OutlineInputBorder(),
                          //border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person),
                          iconColor: Color.fromRGBO(222, 224, 238, 1),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        onChanged: (value) {
                          secondName = value;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextField(
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
                        onChanged: (value) {
                          email =
                              value; // Assign the updated value to the password variable
                        },
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
                    const SizedBox(height: 15),

                    // child: Text('Login'),
                    ElevatedButton(
                      onPressed: () async {
                        print("now \n");
                        print(email);
                        print(password);
                        signup(email, password, firstName, secondName);
                        //Navigator.pushNamed(context, landingScreen.id);
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String? token = prefs.getString("token");
                        print(token);
                        if (token != null) {
                          Navigator.pushNamed(context, landingScreen.id);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => profilePage(
                                        username: firstName,
                                      )));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 60),
                          backgroundColor: const Color.fromARGB(
                              255, 164, 144, 172) // Adjust button size
                          ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(

                            //fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 16),
                      ),
                    ),

                    const Text(
                      'Alrady have an account?',
                      style: TextStyle(
                        fontSize: 10.0, // Adjust the font size of the text
                        color: Color.fromARGB(255, 176, 175, 177),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Implement the action for the "Forgot Password?" link
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => loginPage()));
                      },
                      child: const Text(
                        'Log in',
                        style: TextStyle(
                          color: Color.fromARGB(255, 164, 144, 172),
                          fontSize: 12,
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

signup(email, password, firstName, secondName) async {
  var url = Uri.parse("http://192.168.2.13:5000/signup");
  final http.Response response = await http.post(
    url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, dynamic>{
      'email': email,
      'password': password,
      'firstName': firstName,
      'secondName': secondName,
    }),
  );
  print(response.body);
  var parse = jsonDecode(response.body);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //int counter = (prfs.getInt('counter') ?? 0)+1;
  // print(Pressed $counter times)
  //print(parse["token"]);
  await prefs.setString('token', parse["token"]);

  if (response.statusCode == 200) {
    print('Signup successful');
  } else {
    print('Error: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}

class landingScreen extends StatelessWidget {
  static const String id = "landingScreen"; // Define id as a static const String
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
         child:
         Text("welcom to lading screen"),
         ),
    );
  }
}

