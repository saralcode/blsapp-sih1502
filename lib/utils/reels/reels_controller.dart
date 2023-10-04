import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

enum QuestionType { mcq, short }

class Question {
  QuestionType type = QuestionType.mcq;
  String question = "";
  List<String> options = [];
}

class Reel {
  String id;
  String videoUrl;
  String title;
  late VideoPlayerController controller;
  String description;
  Reel(
      {required this.id,
      required this.videoUrl,
      required this.title,
      this.description = ""});
}

List<Reel> reelData = [
  Reel(
      id: "1234",
      videoUrl: "assets/video1.mp4",
      title: "Line break in html",
      description:
          "Ut aliquip incididunt irure ut reprehenderit sit. Adipisicing nulla exercitation magna aute commodo magna cillum enim aute tempor. Elit non ipsum ipsum elit dolore enim. Nostrud laboris enim quis laborum pariatur velit eu veniam nostrud deserunt. Ea tempor cillum et do aute et ut occaecat do enim consequat aliquip. Ut cupidatat cillum do ad aliqua."),
  Reel(
      id: "1235",
      videoUrl: "assets/video2.mp4",
      title: "Print statement in C language"),
  Reel(
    id: "1234",
    videoUrl: "assets/video1.mp4",
    title: "Line break in html",
  ),
  Reel(
      id: "1235",
      videoUrl: "assets/video2.mp4",
      title: "Print statement in C language"),
  Reel(
    id: "1234",
    videoUrl: "assets/video1.mp4",
    title: "Line break in html",
  ),
  Reel(
      id: "1235",
      videoUrl: "assets/video2.mp4",
      title: "Print statement in C language"),
  Reel(
    id: "1234",
    videoUrl: "assets/video1.mp4",
    title: "Line break in html",
  ),
  Reel(
      id: "1235",
      videoUrl: "assets/video2.mp4",
      title: "Print statement in C language"),
  Reel(
    id: "1234",
    videoUrl: "assets/video1.mp4",
    title: "Line break in html",
  ),
  Reel(
      id: "1235",
      videoUrl: "assets/video2.mp4",
      title: "Print statement in C language"),
  Reel(
    id: "1234",
    videoUrl: "assets/video1.mp4",
    title: "Line break in html",
  ),
  Reel(
      id: "1235",
      videoUrl: "assets/video2.mp4",
      title: "Print statement in C language"),
];

class ReelController extends GetxController {
  List<Reel> loadedReels = [];
  int playingIndex = 0;
  bool dialogCame = false;
  PageController pageController = PageController();

  @override
  void onInit() {
    loadedReels.clear();
    reelData.getRange(0, 3).forEach((element) {
      element.controller = VideoPlayerController.asset(
        element.videoUrl,
      )..initialize().then((_) {
          element.controller.setLooping(true);
          loadedReels.add(element);
          update();
        });
    });
    pageController.addListener(handleScroll);
    update();

    super.onInit();
  }

  void onVideoPlay() {
    VideoPlayerController video = loadedReels[playingIndex].controller;
    log("Playing.. ${video.value.position.inSeconds} ");

    if (video.value.position.inSeconds == 10 && !dialogCame) {
      dialogCame = true;
      video.pause();

      Get.dialog(
        const AlertDialog(
          title: Text("This is a question"),
          content: Text("Options here"),
        ),
      );
    }
  }

  void play() {
    VideoPlayerController video = loadedReels[playingIndex].controller;
    if (video.value.isInitialized) {
      if (!video.value.isPlaying) {
        video.addListener(onVideoPlay);
        video.play();
      }
      update();
    }
  }

  void pause() {
    VideoPlayerController video = loadedReels[playingIndex].controller;
    if (video.value.isInitialized) {
      if (video.value.isPlaying) {
        video.removeListener(onVideoPlay);
        video.pause();
      }
      update();
    }
  }

  void handleScroll() {
    final newPage = pageController.page!.round();
    playingIndex = newPage;
    dialogCame = false;
    if (newPage == 0 || newPage < playingIndex) {
      loadedReels[newPage + 1].controller.pause();
    } else {
      loadedReels[newPage - 1].controller.pause();
    }
    loadedReels[newPage].controller.play();
    update();
  }

  void onPageClose() {
    loadedReels[playingIndex].controller.pause();
  }

  @override
  void onClose() {
    for (var element in loadedReels) {
      element.controller.dispose();
    }
    super.onClose();
  }
}
