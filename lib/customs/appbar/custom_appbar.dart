import 'package:flutter/material.dart';

PreferredSizeWidget customAppbar(
    {required bool isUpdate, required String title}) {
  return AppBar(
    centerTitle: true,
    title: Text("${isUpdate ? "Update" : "Add"} $title"),
  );
}
