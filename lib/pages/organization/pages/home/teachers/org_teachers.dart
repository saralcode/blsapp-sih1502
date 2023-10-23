import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrganizationTeacherPage extends StatefulWidget {
  const OrganizationTeacherPage({super.key});

  @override
  State<OrganizationTeacherPage> createState() =>
      _OrganizationTeacherPageState();
}

class Teacher {
  String name;
  int age;
  String courseOrClass;
  Teacher({required this.name, required this.age, required this.courseOrClass});
}

List<Teacher> teachers = [
  Teacher(name: 'Alice', age: 18, courseOrClass: 'Mathematics'),
  Teacher(name: 'Bob', age: 19, courseOrClass: 'History'),
  Teacher(name: 'Charlie', age: 17, courseOrClass: 'Physics'),
  Teacher(name: 'David', age: 18, courseOrClass: 'English'),
  Teacher(name: 'Eva', age: 19, courseOrClass: 'Chemistry'),
  Teacher(name: 'Frank', age: 17, courseOrClass: 'Biology'),
  Teacher(name: 'Grace', age: 18, courseOrClass: 'Computer Science'),
  Teacher(name: 'Helen', age: 19, courseOrClass: 'Geography'),
  Teacher(name: 'Ian', age: 17, courseOrClass: 'Art'),
  Teacher(name: 'Jack', age: 18, courseOrClass: 'Physical Education'),
  Teacher(name: 'Kate', age: 19, courseOrClass: 'Music'),
  Teacher(name: 'Liam', age: 17, courseOrClass: 'Drama'),
  Teacher(name: 'Nora', age: 18, courseOrClass: 'French'),
  Teacher(name: 'Noah', age: 19, courseOrClass: 'Spanish'),
  Teacher(name: 'Olivia', age: 17, courseOrClass: 'German'),
  Teacher(name: 'Peter', age: 18, courseOrClass: 'Chinese')
];

class _OrganizationTeacherPageState extends State<OrganizationTeacherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teachers"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 5,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SearchBar(
              hintText: "Search a Teacher",
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(5),
                itemCount: teachers.length,
                itemBuilder: (context, index) {
                  Teacher teacher = teachers[index];
                  return Card(
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: ListTile(
                        onTap: () {
                          Get.to(() => const CoursesOrClasses());
                        },
                        leading: Container(
                          decoration: BoxDecoration(
                              color: generateRandomColor(),
                              borderRadius: BorderRadius.circular(20)),
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(
                            teacher.name.substring(0, 1),
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textScaleFactor: 1.2,
                          ),
                        ),
                        title: Text(teacher.name),
                        subtitle: Text("Course: ${teacher.courseOrClass}"),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Age : ${teacher.age}"),
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
