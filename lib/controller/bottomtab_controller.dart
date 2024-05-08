import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varsata/view/home.dart';
import 'package:varsata/view/modalsheetPage.dart';
import 'package:varsata/view/toptabPage.dart';

class bottomtabController extends GetxController {

  RxInt currentIndex = 0.obs;
  List<Widget> tabs = [ modalsheetPage(),homePage(), toptabPage()];
}