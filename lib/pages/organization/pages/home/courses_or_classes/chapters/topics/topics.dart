import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/add_update_post/add_update_post.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/add_update_post/add_update_youtube.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Topic {
  int id;
  String title;
  String description;

  Topic(this.id, this.title, this.description);
}

// Create a list of Topics
List<Topic> topics = [
  Topic(1, "1", "Introduction to the topic."),
  Topic(2, "2", "In-depth discussion on a specific concept."),
  Topic(3, "3", "Exploring advanced topics."),
  // Add more Topics as needed
];

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chapter 1 Topics"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            width: Get.size.width * 0.9,
            child: FloatingActionButton.extended(
                backgroundColor: Colors.indigo.shade700,
                onPressed: () {},
                label: Text("View Study Materials")),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              elevation: MaterialStateProperty.all(2),
              hintText: "Search a topic",
              trailing: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.search))
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: topics.length,
                padding: const EdgeInsets.all(8),
                itemBuilder: (c, index) {
                  Topic topic = topics.elementAt(index);
                  return Card(
                    child: ListTile(
                      onTap: () {},
                      leading: Container(
                        decoration: BoxDecoration(
                            color: generateRandomColor(),
                            borderRadius: BorderRadius.circular(20)),
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        child: Text(
                          topic.title,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                          textScaleFactor: 1.2,
                        ),
                      ),
                      title: Text(topic.description),
                      subtitle: Text("Topic ${topic.title}"),
                    ),
                  );
                }),
          ),
        ],
      ),
      bottomSheet: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.movie_filter,
                  color: Colors.pink,
                  size: 35,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => const PostCUDPage(path: ""));
                },
                child: const Icon(
                  Icons.post_add,
                  color: Colors.purple,
                  size: 35,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => YoutubeCUDPostPage());
                },
                child: const Icon(
                  Icons.videocam,
                  color: Colors.blue,
                  size: 35,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.pink,
                  size: 35,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
