import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/add_update_post/add_update_post.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/add_update_post/add_update_youtube.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/study_materials/post_card.dart';
import 'package:bls/utils/post/post_state.dart';
import 'package:bls/utils/user/user_state.dart';
import 'package:bls/utils/user/user_types.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudyMaterialPage extends StatefulWidget {
  final List<Post> posts;
  const StudyMaterialPage({super.key, required this.posts});

  @override
  State<StudyMaterialPage> createState() => _StudyMaterialPageState();
}

class _StudyMaterialPageState extends State<StudyMaterialPage> {
  List<String> materialTypes = ["ALL", "PDF", "Videos", "Images", "Shorts"];
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (user) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Study Materials"),
        ),
        body: Column(
          children: [
            SizedBox(
              width: Get.size.width,
              height: 80,
              child: ListView.builder(
                itemCount: materialTypes.length,
                itemBuilder: (c, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ChoiceChip(
                      selected: selected == index,
                      onSelected: (v) {},
                      label: Text(
                        materialTypes[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      selectedColor: Colors.pink,
                      color: const MaterialStatePropertyAll(Colors.orange),
                      checkmarkColor: Colors.white,
                    ),
                  );
                },
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: widget.posts.length,
                    itemBuilder: (context, index) {
                      return PostCard(
                        post: widget.posts[index],
                      );
                    }))
            // Expanded(
            //   child: ListView.builder(
            //       reverse: true,
            //       itemCount: 10,
            //       padding: EdgeInsets.all(10),
            //       itemBuilder: (context, index) {
            //         return InkWell(
            //           onTap: () {
            //             Get.to(() => const PdfCard());
            //           },
            //           child: Card(
            //             margin: EdgeInsets.all(10),
            //             color: Colors.blue.shade50,
            //             child: Column(
            //               children: [
            //                 SizedBox(
            //                     height: 300,
            //                     child: Icon(
            //                       Icons.picture_as_pdf,
            //                       size: 80,
            //                       color: Colors.red.shade600,
            //                     )),
            //                 SizedBox(
            //                     height: 60,
            //                     width: Get.size.width,
            //                     child: ListView.builder(
            //                         padding: EdgeInsets.all(8),
            //                         scrollDirection: Axis.horizontal,
            //                         itemCount: 4,
            //                         itemBuilder: (context, index) {
            //                           return Padding(
            //                             padding: const EdgeInsets.all(4.0),
            //                             child: Chip(
            //                                 label: Text(
            //                                     "Practice Set ${index + 1}")),
            //                           );
            //                         })),
            //                 const Card(
            //                   child: ListTile(
            //                     title: Text(
            //                       "Do amet amet consequat reprehenderit tempor ad tempor eu nulla deserunt reprehenderit do.",
            //                       maxLines: 4,
            //                       style: TextStyle(color: Colors.black),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         );
            //       }),
            // )
          ],
        ),
        bottomNavigationBar: user.role == Role.student
            ? null
            : BottomAppBar(
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
                          Get.to(() => const YoutubeCUDPostPage());
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
    });
  }
}
