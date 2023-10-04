import 'package:bls/pages/home/home_page.dart';
import 'package:bls/pages/reels/reels_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.blue.shade800)),
      routes: {
        "/reels": (c) => const ReelsPage(),
      },
      home: const HomePage(),
    );
  }
}
