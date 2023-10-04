import 'package:bls/customs/appbar/custom_appbar.dart';
import 'package:bls/customs/input_decoration/input_decoration.dart';
import 'package:bls/pages/organization/apis/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class ELibraryData {
  String id;
  String name;
  String description;
  String? url;
  List<String> tags;
  List<String> files;
  ELibraryData(
      {required this.id,
      required this.name,
      required this.tags,
      required this.description,
      required this.url,
      required this.files});
}

class CoursesClassesCUDPage extends StatefulWidget {
  final ELibraryData? libraryData;
  final String path;
  const CoursesClassesCUDPage(
      {super.key, this.libraryData, required this.path});

  @override
  State<CoursesClassesCUDPage> createState() => _CoursesClassesCUDPageState();
}

class _CoursesClassesCUDPageState extends State<CoursesClassesCUDPage> {
  GlobalKey<FormBuilderState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppbar(
          isUpdate: widget.libraryData != null, title: "Course/Class"),
      body: FormBuilder(
        key: formkey,
        initialValue: widget.libraryData != null
            ? {
                "name": widget.libraryData!.name,
                "description": widget.libraryData!.description,
                "url": widget.libraryData!.url,
                "tags": widget.libraryData!.tags
              }
            : {},
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            FormBuilderTextField(
              name: "name",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.maxLength(50),
              ]),
              decoration: inputDecoration(
                  hintText: "Course/Class Name", isRequired: true),
            ),
            const SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              name: "description",
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.maxLength(300)
              ]),
              minLines: 5,
              maxLines: 6,
              decoration:
                  inputDecoration(hintText: "Description", isRequired: true),
            ),
            const SizedBox(
              height: 30,
            ),
            ApiController()
                .documentSaveOrUpdate(formKey: formkey, filesKey: []),
            const SizedBox(
              height: 20,
            ),
            ApiController().documentDelete(id: ""),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
