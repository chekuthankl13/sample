import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample/core/utils/utils.dart';
import 'package:sample/presentation/views/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;
 
 @override
  void initState() {
    timer = Timer(const Duration(seconds: 2), (){
      //navigation to home page
      navigatorKey.currentState!.pushReplacement(HomeScreen.route);
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          
        const  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Estore",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            ],
          ),
          spaceHeight(20),
         loading()
        ],
      ),
    );
  }
}