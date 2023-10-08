import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/study_materials/cache_image.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/study_materials/pdf_card.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/study_materials/youtube_post.dart';
import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:bls/pages/organization/pages/search/youtube_thumbnail_view.dart';
import 'package:bls/pages/reels/doubts/show_doubts.dart';
import 'package:bls/utils/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PostCard extends StatefulWidget {
  final Post post;
  const PostCard({super.key, required this.post});

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = true;
  @override
  Widget build(BuildContext context) {
    int likes = widget.post.likes.length;
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                // CircleAvatar(
                //   radius: 20,
                //   backgroundImage: NetworkImage(
                //       "https://images.unsplash.com/photo-1544502062-f82887f03d1c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1918&q=80"),
                //   backgroundColor: Colors.transparent,
                // ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    title: Text(
                      widget.post.title,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(DateFormat("EEEE, d MMMM y, hh:mm a")
                        .format(DateTime.now())),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            if (widget.post.type == PostType.youtube) ...[
              InkWell(
                onTap: () {
                  Get.to(() => ShowYoutubePost(url: widget.post.link!));
                },
                child: Stack(
                  children: [
                    YoutubeThumbnail(url: widget.post.link!),
                    Positioned.fill(
                        child: Container(
                      decoration: const BoxDecoration(
                          border: Border.symmetric(
                              horizontal:
                                  BorderSide(width: 35, color: Colors.white))),
                    )),
                    const Positioned.fill(
                        child: Align(
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.play_arrow_rounded,
                        size: 80,
                        color: Colors.white,
                      ),
                    ))
                  ],
                ),
              )
            ] else if (widget.post.type == PostType.pdf) ...[
              InkWell(
                onTap: () {
                  Get.to(() => PDFViewerPage(
                        url: widget.post.link!,
                        title: widget.post.title,
                      ));
                },
                child: Container(
                  height: 300,
                  width: Get.size.width,
                  color: generateRandomColor(),
                  child: const Icon(
                    Icons.picture_as_pdf,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
              )
            ] else ...[
              CacheImage(url: widget.post.images![0]),
            ],
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(children: [
                IconButton(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    constraints: const BoxConstraints(),
                    iconSize: 28,
                    onPressed: () {
                      setState(() {
                        liked = !liked;
                        if (liked) {
                          likes += 1;
                        } else {
                          likes -= 1;
                        }
                      });
                    },
                    icon: liked == true
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        : const Icon(Icons.favorite_border)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    constraints: const BoxConstraints(),
                    iconSize: 28,
                    onPressed: () {
                      showDoubts();
                    },
                    icon: const Icon(Icons.comment_rounded)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                    constraints: const BoxConstraints(),
                    onPressed: () {},
                    iconSize: 28,
                    icon: const Icon(Icons.bookmark_outline)),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: Row(children: [
                Text("$likes likes"),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
