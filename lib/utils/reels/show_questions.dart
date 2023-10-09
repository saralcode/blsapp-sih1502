import 'package:bls/pages/practice_set/practice_set_controller.dart';
import 'package:bls/pages/practice_set/practice_set_page.dart';
import 'package:bls/utils/reels/reels_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowQuestionsSheet extends StatefulWidget {
  final Question question;
  const ShowQuestionsSheet({super.key, required this.question});

  @override
  State<ShowQuestionsSheet> createState() => _ShowQuestionsSheetState();
}

class _ShowQuestionsSheetState extends State<ShowQuestionsSheet> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReelController>(builder: (state) {
      return BottomSheet(
          showDragHandle: true,
          enableDrag: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25.0),
            ),
          ),
          onClosing: () {},
          builder: (context) {
            return PracticeSetPage(
              shortsQuestion: [widget.question],
            );
          });
    });
  }
}
