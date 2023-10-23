import 'package:bls/customs/design_button/design_button.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/subjects/organization_subject_page.dart';
import 'package:bls/pages/teacher/pages/home/teacher_home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentHomePage extends StatefulWidget {
  const StudentHomePage({super.key});

  @override
  State<StudentHomePage> createState() => _StudentHomePageState();
}

class TableData {
  String title;
  String description;
  TableData(this.title, this.description);
}

List<TableData> orgDetails = [
  TableData("Name", "XYZ Organization"),
  TableData("Place", "Ranchi Jharkhand"),
  TableData("Students", "800"),
  TableData("Faculties", "50")
];
List<TableData> courseDetails = [
  TableData("Course Name", "B.Sc. Computer Application"),
  TableData("Session", "2021-2024"),
  TableData("Semester", "2")
];

class _StudentHomePageState extends State<StudentHomePage> {
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
            text: "Organization Details",
          ),
          showTable(orgDetails),
          const SizedBox(
            height: 10,
          ),
          customText(text: "Course Details"),
          showTable(courseDetails),
          const SizedBox(
            height: 10,
          ),
          customText(text: "Recents Topics"),
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
              text: "Study Materials",
              onClick: () {
                Get.to(() => const SubjectsPage());
              },
              begin: Colors.orange,
              end: Colors.deepOrange),
          designButton(
              text: "Practice Questions",
              begin: Colors.pink,
              end: Colors.pinkAccent.shade700),
        ],
      ),
    );
  }
}

Widget showTable(List<TableData> tableData) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Table(
        border: TableBorder.all(
            color: Colors.blue, borderRadius: BorderRadius.circular(2)),
        children: tableData
            .map((e) => TableRow(children: [
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.title,
                        textScaleFactor: 1.3,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        e.description,
                        textScaleFactor: 1.2,
                      ),
                    ),
                  ),
                ]))
            .toList()),
  );
}
