import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:bls/pages/organization/pages/home/org_student/org_student_analytics/org_student_analytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationStudentPage extends StatefulWidget {
  const OrganizationStudentPage({super.key});

  @override
  State<OrganizationStudentPage> createState() =>
      _OrganizationStudentPageState();
}

class Student {
  String name;
  int age;
  String courseOrClass;
  Student({required this.name, required this.age, required this.courseOrClass});
}

List<Student> students = [
  Student(name: 'Alice', age: 18, courseOrClass: 'Mathematics'),
  Student(name: 'Bob', age: 19, courseOrClass: 'History'),
  Student(name: 'Charlie', age: 17, courseOrClass: 'Physics'),
  Student(name: 'David', age: 18, courseOrClass: 'English'),
  Student(name: 'Eva', age: 19, courseOrClass: 'Chemistry'),
  Student(name: 'Frank', age: 17, courseOrClass: 'Biology'),
  Student(name: 'Grace', age: 18, courseOrClass: 'Computer Science'),
  Student(name: 'Helen', age: 19, courseOrClass: 'Geography'),
  Student(name: 'Ian', age: 17, courseOrClass: 'Art'),
  Student(name: 'Jack', age: 18, courseOrClass: 'Physical Education'),
  Student(name: 'Kate', age: 19, courseOrClass: 'Music'),
  Student(name: 'Liam', age: 17, courseOrClass: 'Drama'),
  Student(name: 'Nora', age: 18, courseOrClass: 'French'),
  Student(name: 'Noah', age: 19, courseOrClass: 'Spanish'),
  Student(name: 'Olivia', age: 17, courseOrClass: 'German'),
  Student(name: 'Peter', age: 18, courseOrClass: 'Chinese')
];

class _OrganizationStudentPageState extends State<OrganizationStudentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Students"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(
              hintText: "Search a Student",
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: students.length,
                itemBuilder: (context, index) {
                  Student student = students[index];
                  return Card(
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: ListTile(
                        onTap: () {
                          Get.to(() => const OrgStudentAnalytics());
                        },
                        leading: Container(
                          decoration: BoxDecoration(
                              color: generateRandomColor(),
                              borderRadius: BorderRadius.circular(20)),
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(
                            student.name.substring(0, 1),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textScaleFactor: 1.2,
                          ),
                        ),
                        title: Text(student.name),
                        subtitle: Text("Course: ${student.courseOrClass}"),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Age : ${student.age}"),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
