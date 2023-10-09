import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/study_materials/cache_image.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/study_materials/study_materials.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:bls/pages/organization/pages/search/youtube_thumbnail_view.dart';
import 'package:bls/utils/post/post_state.dart';
import 'package:bls/utils/post/posts.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class TeacherSearchPage extends StatefulWidget {
  const TeacherSearchPage({super.key});

  @override
  State<TeacherSearchPage> createState() => _TeacherSearchPageState();
}

class _TeacherSearchPageState extends State<TeacherSearchPage> {
  @override
  void initState() {
    Get.put(PostController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Material(
              color: Colors.blue,
              elevation: 2,
              // decoration: const BoxDecoration(color: Colors.blue),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBar(
                  elevation: MaterialStateProperty.all(2),
                  hintText: "Search something",
                  trailing: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.search))
                  ],
                ),
              ),
            ),
            Expanded(child: GetBuilder<PostController>(builder: (state) {
              return GridView.custom(
                gridDelegate: SliverQuiltedGridDelegate(
                  crossAxisCount: 4,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                  repeatPattern: QuiltedGridRepeatPattern.inverted,
                  pattern: [
                    const QuiltedGridTile(2, 2),
                    const QuiltedGridTile(2, 2),
                    const QuiltedGridTile(2, 4),
                    // const QuiltedGridTile(1, 4),
                  ],
                ),
                childrenDelegate: SliverChildBuilderDelegate(
                  childCount: state.posts.length,
                  (context, index) {
                    Post post = state.posts.elementAt(index);
                    return InkWell(
                      onTap: () {
                        Get.to(() => StudyMaterialPage(
                              posts: state.posts,
                            ));
                      },
                      child: displayPostThumbnail(post),
                    );
                  },
                ),
              );
            }))
          ],
        ),
      ),
    );
  }
}

Widget displayPostThumbnail(Post post) {
  switch (post.type) {
    case PostType.images:
      return Card(child: CacheImage(url: post.images![0]));
    case PostType.youtube:
      return Card(
        child: YoutubeThumbnail(url: post.link!),
      );
    case PostType.pdf:
      return Card(
        color: generateRandomColor(),
        child: const Center(
          child: Icon(
            Icons.picture_as_pdf,
            size: 50,
            color: Colors.white,
          ),
        ),
      );
    default:
      return Container(
        color: generateRandomColor(),
      );
  }
}
