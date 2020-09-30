import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/HomeScreen.dart';
import 'package:todo/screens/TodoScreen.dart';

void main(){
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,

      ),
      home: HomeScreen(),

  ));

}

