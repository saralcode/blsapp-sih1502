import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/topics.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text("B.Sc Computer Application"),
      ),
      body: ListView.builder(
          itemCount: chapterList.length,
          padding: const EdgeInsets.all(8),
          itemBuilder: (c, index) {
            Chapter chapter = chapterList.elementAt(index);
            return Card(
              child: ListTile(
                onTap: () {
                  Get.to(() => TopicPage());
                },
                leading: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20)),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  child: Text(
                    chapter.title,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textScaleFactor: 1.2,
                  ),
                ),
                title: Text(chapter.description),
                subtitle: Text("Chapter ${chapter.title}"),
              ),
            );
          }),
    );
  }
}
