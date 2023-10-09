import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/chapters.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class Subject {
  int id;
  String title;
  String description;

  Subject(this.id, this.title, this.description);
}

class _SubjectsPageState extends State<SubjectsPage> {
  List<Subject> physicsSubjects = [
    Subject(1, "Classical Mechanics", "Study of the motion of objects."),
    Subject(
        2, "Electromagnetism", "Exploring electric and magnetic phenomena."),
    Subject(3, "Thermodynamics", "Understanding heat and energy transfer."),
    Subject(4, "Quantum Mechanics",
        "Exploring the behavior of particles at the quantum level."),
    // Add more subjects as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subjects"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              elevation: MaterialStateProperty.all(2),
              hintText: "Search a subject",
              trailing: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: physicsSubjects.length,
                itemBuilder: (context, index) {
                  Subject subject = physicsSubjects[index];
                  return Card(
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      title: ListTile(
                        onTap: () {
                          Get.to(() => const ChapterPage());
                        },
                        leading: Container(
                          decoration: BoxDecoration(
                              color: generateRandomColor(),
                              borderRadius: BorderRadius.circular(20)),
                          height: 40,
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(
                            "${subject.id}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textScaleFactor: 1.2,
                          ),
                        ),
                        title: Text(subject.title),
                        subtitle: Text("Book ${subject.id}"),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(subject.description),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        height: 65,
        child: Center(
          child: FloatingActionButton.extended(
              backgroundColor: Colors.pink,
              onPressed: () {
                // Get.to(() => const CoursesClassesCUDPage(path: "/"));
              },
              label: const Text("Add Subjects/Books")),
        ),
      ),
    );
  }
}
