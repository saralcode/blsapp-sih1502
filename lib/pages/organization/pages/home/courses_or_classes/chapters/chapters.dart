import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/topics.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:bls/utils/user/user_state.dart';
import 'package:bls/utils/user/user_types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chapter {
  int id;
  String title;
  String description;

  Chapter(this.id, this.title, this.description);
}

// Create a list of chapters
List<Chapter> chapterList = [
  Chapter(1, "1", "Introduction to the topic."),
  Chapter(2, "2", "In-depth discussion on a specific concept."),
  Chapter(3, "3", "Exploring advanced topics."),
  // Add more chapters as needed
];

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key});

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (user) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Chapters"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchBar(
                elevation: MaterialStateProperty.all(2),
                hintText: "Search a Chapter",
                trailing: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: chapterList.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (c, index) {
                    Chapter chapter = chapterList.elementAt(index);
                    return Card(
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        title: ListTile(
                          onTap: () {
                            Get.to(() => const TopicPage());
                          },
                          leading: Container(
                            decoration: BoxDecoration(
                                color: generateRandomColor(),
                                borderRadius: BorderRadius.circular(20)),
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: Text(
                              chapter.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.2,
                            ),
                          ),
                          title: Text(chapter.description),
                          subtitle: Text("Chapter ${chapter.title}"),
                        ),
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                                "Magna nostrud esse occaecat cupidatat aliquip consequat laborum pariatur culpa. Excepteur aliquip velit laboris proident et adipisicing incididunt nisi mollit amet. Reprehenderit ad veniam excepteur enim quis dolor ullamco incididunt mollit labore ex. Excepteur incididunt ea veniam sint ipsum deserunt aliqua. Velit irure officia consectetur duis do elit amet do enim pariatur. Lorem deserunt tempor reprehenderit ullamco commodo."),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
        bottomNavigationBar: user.role == Role.student
            ? null
            : BottomAppBar(
                height: 65,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton.extended(
                        backgroundColor: Colors.pink,
                        onPressed: () {
                          // Get.to(() => const path: "/"));
                        },
                        icon: const Icon(Icons.library_add),
                        label: const Text("Add a Chapter")),
                    if (user.role == Role.organization)
                      FloatingActionButton.extended(
                          backgroundColor: Colors.blue,
                          heroTag: "assign-teacher",
                          onPressed: () {
                            // Get.to(() => const path: "/"));
                          },
                          icon: const Icon(Icons.person),
                          label: const Text("Assign Teacher")),
                  ],
                ),
              ),
      );
    });
  }
}
