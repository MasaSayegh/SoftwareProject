import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:software_p/bottom_nav_bar.dart';
import 'package:software_p/custom_scalfold.dart';

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context){
    return const CustomScaffold(
     body: SingleChildScrollView(child: Text('Home'),),
     showBottomNavBar: true,
     initialIndex: 0, 
 

    );
  }
}

