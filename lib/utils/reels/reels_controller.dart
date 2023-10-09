import 'dart:developer';

import 'package:bls/pages/practice_set/practice_set_controller.dart';
import 'package:bls/utils/reels/show_questions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ShortsQuestion {
  Question question;
  int duration;
  bool? userAnser;
  ShortsQuestion(
      {required this.duration, required this.question, this.userAnser});
}

class Reel {
  String id;
  String videoUrl;
  String title;
  ShortsQuestion? question;
  late VideoPlayerController controller;
  String description;
  Reel(
      {required this.id,
      required this.videoUrl,
      required this.title,
      this.question,
      this.description = ""});
}

List<Reel> reelData = [
  Reel(
      id: "1235",
      videoUrl: "assets/video1.mp4",
      question: ShortsQuestion(
        duration: 29,
        // duration: 1,
        question: Question.mcq(MCQ(
            questionText: "What will be the output?",
            choices: [" Hello", "0", "5", "Error"],
            answer: 2)),
      ),
      title: "Print statement in C language"),
  Reel(
      id: "1234",
      videoUrl: "assets/video2.mp4",
      title: "Line break in html with Question",
      question: ShortsQuestion(
          duration: 18,
          // duration: 1,
          question: Question.mcq(MCQ(
              questionText:
                  "The ...... tag inserts a single line break in html?",
              choices: ["<break>", "<br>", "<line>", "<new line>"],
              answer: 1))),
      description:
          "Ut aliquip incididunt irure ut reprehenderit sit. Adipisicing nulla exercitation magna aute commodo magna cillum enim aute tempor. Elit non ipsum ipsum elit dolore enim. Nostrud laboris enim quis laborum pariatur velit eu veniam nostrud deserunt. Ea tempor cillum et do aute et ut occaecat do enim consequat aliquip. Ut cupidatat cillum do ad aliqua."),
  Reel(
    id: "1234",
    question: ShortsQuestion(
      duration: 18,
      question: Question.mcq(MCQ(
          questionText: "int p* = 1000;\np=p+5;",
          choices: ["5000", "1020", "1005", "Error"],
          answer: 1)),
    ),
    videoUrl: "assets/video3.mp4",
    title: "Pointers in C++",
  ),
];

class ReelController extends GetxController {
  List<Reel> loadedReels = [];
  int playingIndex = 0;

  PageController pageController = PageController();
  @override
  void onInit() {
    loadedReels.clear();
    for (var element in reelData) {
      element.controller = VideoPlayerController.asset(
        element.videoUrl,
      )..initialize().then((_) {
          element.controller.setLooping(true);
          loadedReels.add(element);
          update();
        });
    }
    pageController.addListener(handleScroll);
    update();
    // loadedReels[playingIndex].controller.addListener(onVideoPlay);
    update();

    super.onInit();
  }

  void showBottomSheet() {
    ShortsQuestion? question = loadedReels[playingIndex].question;
    Get.bottomSheet(
      ShowQuestionsSheet(
        question: question!.question,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      enableDrag: false,
    );
  }

  int openedBottomSheetIndex = -1;

  void onVideoPlay() {
    VideoPlayerController video = loadedReels[playingIndex].controller;
    log("Playing.. ${video.value.position.inSeconds} ");
    ShortsQuestion? question = loadedReels[playingIndex].question;
    update();
    if (question != null && openedBottomSheetIndex != playingIndex) {
      if (video.value.position.inSeconds == question.duration &&
          question.userAnser == null) {
        openedBottomSheetIndex = playingIndex;
        video.pause();
        update();
        Get.bottomSheet(ShowQuestionsSheet(question: question.question));
      }
    }
  }

  bool isPlayed = false;
  void play() {
    if (!isPlayed) {
      loadedReels[playingIndex].controller.addListener(onVideoPlay);
      isPlayed = true;
      update();
    }
    VideoPlayerController video = loadedReels[playingIndex].controller;
    if (video.value.isInitialized) {
      if (!video.value.isPlaying) {
        video.play();
      }
      update();
    }
  }

  void pause() {
    VideoPlayerController video = loadedReels[playingIndex].controller;
    if (video.value.isInitialized) {
      if (video.value.isPlaying) {
        video.pause();
      }
      update();
    }
  }

  void handleScroll() {
    final newPage = pageController.page!.round();
    playingIndex = newPage;

    if (newPage == 0 || newPage < playingIndex) {
      loadedReels[newPage + 1].controller.pause();
      loadedReels[newPage + 1].controller.removeListener(onVideoPlay);
    } else {
      loadedReels[newPage - 1].controller.pause();
      loadedReels[newPage - 1].controller.removeListener(onVideoPlay);
    }
    loadedReels[newPage].controller.addListener(onVideoPlay);
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
