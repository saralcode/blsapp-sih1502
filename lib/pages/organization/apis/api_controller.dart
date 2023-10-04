import 'package:bls/customs/deleteDialog/delete_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  Widget documentSaveOrUpdate(
      {required GlobalKey<FormBuilderState> formKey,
      String? id,
      Map<String, dynamic>? customData,
      required List<String>? filesKey}) {
    return FloatingActionButton.extended(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            Map<String, dynamic> formData = formKey.currentState!.fields
                .map((key, value) => MapEntry(key, value.value));
            if (filesKey != null) {
              List<String> ids = [];
              for (int i = 0; i < filesKey.length; i++) {
                ids.insertAll(i, formData[filesKey[i]].toString().split(","));
              }
              formData["files"] = ids;
            }
            if (customData != null) {
              formData.addAll(customData);
            }
          }
        },
        label: Text(id == null ? "Save" : "Update"));
  }

  Widget documentDelete({
    required String? id,
  }) {
    return Visibility(
      visible: id != null,
      child: FloatingActionButton.extended(
          heroTag: "delete",
          backgroundColor: Colors.pink,
          icon: const Icon(Icons.delete),
          label: const Text("Delete"),
          onPressed: () {
            if (id != null) {
              showDeleteDialog(
                  isSave: false,
                  onYes: () async {
                    try {
                      Get.snackbar("Deleted", "Deleted Successfully!");
                    } catch (e) {
                      Get.back();
                      Get.snackbar("Error", "$e");
                    }
                  });
            }
          }),
    );
  }
}
