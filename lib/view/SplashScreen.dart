import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:varsata/view/bottomtab_navigation.dart';
import 'package:varsata/widget/common_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState () {
    super.initState();
    wheretogo();
  }

  void wheretogo () async{
    var sharepref = await SharedPreferences.getInstance();
    var isloggedin = sharepref.getBool('LoginS');
    var isloggedinAdmin = sharepref.getBool('LoginA');
    var isloggedinFaculty = sharepref.getBool('LoginF');
    dynamic details =sharepref.getString('name');


    print(isloggedin );
    Timer(const Duration(seconds:2), () {
     
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> bottomtab_navigation()));
  })
    ;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: fullWidth(context) * 0.65,
          height: fullHeight(context) * .25,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/LOGO.png'), fit: BoxFit.contain),
          ),
        ),
      ),
    );
  }
}
