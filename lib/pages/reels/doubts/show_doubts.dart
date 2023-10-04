import 'package:bls/pages/reels/doubts/doubt_page.dart';
import 'package:bls/pages/reels/doubts/doubts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showDoubts() {
  Get.put(DoubtController());
  Get.bottomSheet(
    const DoubtsPage(
      postId: "",
    ),
    isScrollControlled: true,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
  );
}
