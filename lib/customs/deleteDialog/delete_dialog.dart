import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<void> showDeleteDialog(
    {required bool isSave, required Function() onYes}) async {
  Get.dialog(AlertDialog(
    title: Text(
      isSave ? "Save" : "Delete",
    ),
    content: Text("Are you sure to ${isSave ? "Save" : "Delete"}?"),
    actions: [
      TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            "Cancel",
            textScaleFactor: 1.1,
          )),
      TextButton(
          onPressed: () async {
            onYes();
            Get.back();
          },
          child: Text(
            isSave ? "Save" : "Delete",
            style: TextStyle(color: isSave ? Colors.green : Colors.red),
            textScaleFactor: 1.1,
          )),
    ],
  ));
}
