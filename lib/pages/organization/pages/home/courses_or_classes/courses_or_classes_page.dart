import 'dart:math';

import 'package:bls/pages/organization/pages/home/courses_or_classes/add_update_courses_classes/add_update_courses_classes.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/chapters.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Course {
  int id;
  String name;
  String description;

  Course(this.id, this.name, this.description);
}

// Create a list of courses with id, name, and description
List<Course> courseList = [
  Course(1, "B.Sc Physics", "Study of physical properties and natural laws."),
  Course(2, "B.Sc Chemistry", "Exploring the world of chemical compounds."),
  Course(3, "B.Sc Computer Application",
      "Learn software development and applications."),

  Course(4, "B.A English Literature", "Study classic and modern literature."),
  Course(5, "B.Com Accounting", "Learn financial and managerial accounting."),
  Course(6, "B.Sc Physics", "Study of physical properties and natural laws."),
  Course(7, "B.Sc Chemistry", "Exploring the world of chemical compounds."),
  Course(8, "B.Sc Computer Application",
      "Learn software development and applications."),
  // Add more courses with their respective details
];

List<Color> colorList = [
  Colors.red,
  Colors.green,
  Colors.blue,
  Colors.pink,
  Colors.orange,
  Colors.purple,
];

Color randomColor = Colors.white; // Initial color

Color generateRandomColor() {
  final Random random = Random();
  final int randomIndex = random.nextInt(colorList.length);
  return colorList[randomIndex];
}

class CoursesOrClasses extends StatefulWidget {
  const CoursesOrClasses({super.key});

  @override
  State<CoursesOrClasses> createState() => _CoursesOrClassesState();
}

class _CoursesOrClassesState extends State<CoursesOrClasses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Courses/Classes"),
      ),
      body: GridView.builder(
          itemCount: courseList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 5),
          padding: const EdgeInsets.all(5),
          itemBuilder: (c, index) {
            Course course = courseList.elementAt(index);
            return Material(
              child: InkWell(
                onTap: () {
                  Get.to(() => ChapterPage());
                },
                child: Card(
                    elevation: 10,
                    child: Column(
                      children: [
                        Container(
                            padding: const EdgeInsets.all(8),
                            alignment: Alignment.center,
                            decoration:
                                BoxDecoration(color: generateRandomColor()),
                            child: Text(
                              course.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            course.description,
                            textScaleFactor: 1.2,
                          ),
                        ),
                        Expanded(child: Container()),
                        TextButton.icon(
                            label: const Text("Edit"),
                            onPressed: () {},
                            icon: const Icon(Icons.edit))
                      ],
                    )),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.pink,
          onPressed: () {
            Get.to(() => const CoursesClassesCUDPage(path: "/"));
          },
          label: const Text("Add Classe/Course")),
    );
  }
}
