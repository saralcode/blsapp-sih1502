import 'package:bls/customs/design_button/design_button.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationHomePage extends StatefulWidget {
  const OrganizationHomePage({super.key});

  @override
  State<OrganizationHomePage> createState() => _OrganizationHomePageState();
}

class _OrganizationHomePageState extends State<OrganizationHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        children: [
          deisgnButton(
              text: "Classes/Courses",
              onClick: () {
                Get.to(() => const CoursesOrClasses());
              },
              begin: Colors.pink,
              end: Colors.pinkAccent.shade700),
          deisgnButton(
              text: "Teachers", begin: Colors.orange, end: Colors.deepOrange),
          deisgnButton(
              text: "Students",
              begin: Colors.purple,
              end: Colors.deepPurple.shade700),
        ],
      ),
    );
  }
}
