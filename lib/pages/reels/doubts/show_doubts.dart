import 'package:bls/pages/reels/doubts/doubt_page.dart';
import 'package:bls/pages/reels/doubts/doubts_controller.dart';
import 'package:get/get.dart';

void showDoubts() {
  Get.put(DoubtController());
  Get.to(
    () => const DoubtsPage(
      postId: "",
    ),
  );
}
