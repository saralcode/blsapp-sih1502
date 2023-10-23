import 'package:bls/pages/organization/layout/organization_layout.dart';
import 'package:bls/pages/student/layout/student_layout.dart';
import 'package:bls/pages/teacher/layout/teacher_layout.dart';
import 'package:bls/utils/user/user_state.dart';
import 'package:bls/utils/user/user_types.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Get.put(UserController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (user) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          // elevation: 0,
          title: const Text("Blended Learning System"),
          centerTitle: true,
        ),
        body: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  colors: [Color(0xff005C97), Color(0xff363795)])),
          child: SafeArea(
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1, childAspectRatio: 4 / 3),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
              children: [
                showCard(
                    title: "Organization",
                    icon: Icons.business,
                    onPressed: () {
                      user.setRole(Role.organization);
                      Get.to(() => const OrganizationLayout());
                    }),
                GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: [
                    showCard(
                        title: "Teacher",
                        icon: Icons.school,
                        onPressed: () {
                          user.setRole(Role.teacher);
                          Get.to(() => const TeacherLayout());
                        }),
                    showCard(
                        title: "Student",
                        icon: Icons.person,
                        onPressed: () {
                          user.setRole(Role.student);
                          Get.to(() => const StudentLayout());
                        }),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}

Widget showCard(
    {required IconData icon,
    required String title,
    void Function()? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Card(
        child: Padding(
      padding: const EdgeInsets.all(30),
      child: AspectRatio(
        aspectRatio: 4 / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.pink,
              size: 50,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "serif"),
            )
          ],
        ),
      ),
    )),
  );
}
