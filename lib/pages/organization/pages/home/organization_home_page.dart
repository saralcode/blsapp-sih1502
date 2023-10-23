import 'package:bls/customs/design_button/design_button.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:bls/pages/organization/pages/home/org_student/org_student_page.dart';
import 'package:bls/pages/organization/pages/home/teachers/org_teachers.dart';
import 'package:bls/pages/student/pages/home/student_home_page.dart';
import 'package:bls/pages/teacher/pages/home/teacher_home_page.dart';
import 'package:bls/utils/user/user_state.dart';

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
    return GetBuilder<UserController>(builder: (user) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            customText(text: "Organization Details"),
            showTable(orgDetails),
            designButton(
                text: "Classes/Courses",
                onClick: () {
                  Get.to(() => const CoursesOrClasses());
                },
                begin: Colors.pink,
                end: Colors.pinkAccent.shade700),
            designButton(
                onClick: () {
                  Get.to(() => const OrganizationTeacherPage());
                },
                text: "Teachers",
                begin: Colors.orange,
                end: Colors.deepOrange),
            designButton(
                text: "Students",
                onClick: () {
                  Get.to(() => const OrganizationStudentPage());
                },
                begin: Colors.purple,
                end: Colors.deepPurple.shade700),
          ],
        ),
      );
    });
  }
}
