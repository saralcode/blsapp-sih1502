import 'package:bls/pages/practice_set/practice_set_page.dart';
import 'package:bls/pages/reels/doubts/profile_avatar.dart';
import 'package:bls/pages/reels/doubts/show_doubts.dart';
import 'package:bls/utils/reels/reels_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:video_player/video_player.dart';

class ReelsPage extends StatefulWidget {
  const ReelsPage({super.key});

  @override
  State<ReelsPage> createState() => _ReelsPageState();
}

class _ReelsPageState extends State<ReelsPage> {
  @override
  void initState() {
    Get.put(ReelController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ReelController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReelController>(builder: (state) {
      return WillPopScope(
        onWillPop: () async {
          state.onPageClose();
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          appBar: AppBar(
            title: const Text("Shorts"),
          ),
          body: SafeArea(
            child: state.loadedReels.isEmpty
                ? const Center(
                    child: Text("Loading..."),
                  )
                : PageView.builder(
                    controller: state.pageController,
                    scrollDirection: Axis.vertical,
                    itemCount: state.loadedReels.length,
                    itemBuilder: (context, index) {
                      VideoPlayerController controller =
                          state.loadedReels[index].controller;
                      VideoPlayerValue video =
                          state.loadedReels[index].controller.value;
                      if (video.isInitialized) {
                        return Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: video.aspectRatio,
                                child: VideoPlayer(controller),
                              ),
                              Positioned.fill(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        height: 80,
                                        width: 80,
                                        child: Material(
                                          color: Colors.black.withOpacity(
                                              video.isPlaying ? 0.1 : 0.4),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          child: IconButton(
                                            icon: Icon(
                                              !video.isPlaying
                                                  ? Icons.play_arrow_rounded
                                                  : Icons.pause,
                                              size: 60,
                                              color: video.isPlaying
                                                  ? Colors.white
                                                      .withOpacity(0.2)
                                                  : Colors.white,
                                            ),
                                            onPressed: () {
                                              if (video.isPlaying) {
                                                state.pause();
                                              } else {
                                                state.play();
                                              }
                                            },
                                          ),
                                        ),
                                      ))),
                              Positioned.fill(
                                  child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.4),
                                        blurRadius: 60,
                                        spreadRadius: 20,
                                      )
                                    ],
                                    // color: Colors.black.withOpacity(0.5),
                                  ),
                                  padding: const EdgeInsets.only(
                                      bottom: 0, left: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints(
                                            maxWidth: Get.size.width * 0.8),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                const ProfileAvatar(
                                                    username: "Sonu"),
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                const Text(
                                                  "Sonu",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                      color: Colors.white),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                const Icon(
                                                  Icons.circle,
                                                  size: 5,
                                                  color: Colors.white,
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                TextButton(
                                                    onPressed: () {},
                                                    child: const Text("Follow"))
                                              ],
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  state.pause();
                                                  Get.to(() =>
                                                      const PracticeSetPage());
                                                },
                                                child: const Text(
                                                    "Solve Practice Set")),
                                            Text(
                                              state
                                                  .loadedReels[
                                                      state.playingIndex]
                                                  .title,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            ReadMoreText(
                                              state
                                                  .loadedReels[
                                                      state.playingIndex]
                                                  .description,
                                              trimLength: 100,
                                              style: const TextStyle(
                                                  color: Colors.white),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                          ],
                                        ),
                                      ),
                                      VideoProgressIndicator(
                                        controller,
                                        allowScrubbing: true,
                                      )
                                    ],
                                  ),
                                ),
                              ))
                            ],
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              showActionButton(
                icon: const Icon(Icons.favorite_border),
                text: "Likes",
                onPressed: () {
                  // Handle the comment button action.
                },
              ),
              showActionButton(
                  icon: const Icon(Icons.comment),
                  text: "Doubts",
                  onPressed: showDoubts),
              showActionButton(
                icon:
                    Transform.flip(flipX: true, child: const Icon(Icons.reply)),
                text: "Share",
                onPressed: () {
                  // Handle the comment button action.
                },
              ),
              showActionButton(
                icon: const Icon(Icons.more_vert),
                text: "",
                onPressed: () {
                  // Handle the comment button action.
                },
              ),
            ]),
          ),
        ),
      );
    });
  }
}

Widget showActionButton(
    {required Widget icon, void Function()? onPressed, required String text}) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2),
    child: Material(
      color: Colors.black.withOpacity(0.4),
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        child: Column(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: icon,
              color: Colors.white,
              iconSize: 30,
            ),
            if (text.isNotEmpty)
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              )
          ],
        ),
      ),
    ),
  );
}
