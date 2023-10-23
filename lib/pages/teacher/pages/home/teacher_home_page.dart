import 'package:bls/customs/design_button/design_button.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:bls/pages/student/pages/home/student_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherHomePage extends StatefulWidget {
  const TeacherHomePage({super.key});

  @override
  State<TeacherHomePage> createState() => _TeacherHomePageState();
}

class _TeacherHomePageState extends State<TeacherHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          customText(
            text: "Your Organization",
          ),
          showTable(orgDetails),
          const SizedBox(
            height: 20,
          ),
          customText(
            text: "On Going Topic/Chapter",
          ),
          Stepper(
              onStepCancel: () {},
              onStepContinue: () {},
              margin: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              // connectorColor: MaterialStatePropertyAll(Colors.green),
              controlsBuilder: (context, details) {
                return Container();
              },
              steps: const [
                Step(
                    isActive: true,
                    title: Text("Data Structure and Algorithm"),
                    subtitle: Text("Linked List"),
                    content: Column(
                      children: [],
                    ),
                    state: StepState.editing),
                Step(
                    isActive: true,
                    title: Text("Programming with C++"),
                    subtitle: Text("Constructors"),
                    content: Column(
                      children: [],
                    ),
                    state: StepState.editing),
                Step(
                    isActive: true,
                    title: Text("DBMS"),
                    subtitle: Text("Installation of MySQL"),
                    content: Column(
                      children: [],
                    ),
                    state: StepState.editing),
              ]),
          designButton(
              text: "Your Courses",
              onClick: () {
                Get.to(() => const CoursesOrClasses());
              }),
        ],
      ),
    );
  }
}

Widget customText(
    {required String text, TextAlign? align, double fontSize = 20}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          textAlign: align,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: fontSize,
              letterSpacing: 1,
              color: Colors.indigo.shade800),
        ),
        const SizedBox(
          height: 10,
        ),
        Divider(
          color: Colors.indigo,
          thickness: 2,
          endIndent: Get.width * 0.7,
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
