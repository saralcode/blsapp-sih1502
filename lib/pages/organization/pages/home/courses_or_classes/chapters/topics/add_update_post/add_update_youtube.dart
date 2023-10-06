import 'dart:convert';
import 'dart:developer';

import 'package:bls/customs/formContext/form_context_menu.dart';
import 'package:bls/customs/input_decoration/input_decoration.dart';
import 'package:bls/pages/organization/apis/api_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeCUDPostPage extends StatefulWidget {
  final Map<String, dynamic>? update;

  final String? itemId;
  const YoutubeCUDPostPage({super.key, this.update, this.itemId});

  @override
  State<YoutubeCUDPostPage> createState() => _YoutubeCUDPostPageState();
}

class _YoutubeCUDPostPageState extends State<YoutubeCUDPostPage> {
  GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  bool isValid = false;
  late YoutubePlayerController ytcontroller;
  @override
  void initState() {
    if (widget.update != null) {}
    super.initState();
  }

  Future<bool> isValidUrl() async {
    try {
      String youtube = formKey.currentState!.fields['youtube']!.value;
      formKey.currentState!.reset();
      Uri uri =
          Uri.parse("https://www.youtube.com/oembed?url=$youtube&format=json");
      http.Response data = await http.get(uri);

      if (data.statusCode == 200) {
        isValid = true;
        setState(() {});
        ytcontroller = YoutubePlayerController(
            initialVideoId: YoutubePlayer.convertUrlToId(youtube)!,
            flags: const YoutubePlayerFlags(autoPlay: false, mute: false));

        Map jsonData = jsonDecode(data.body);
        log("$jsonData");
        String title = jsonData['title'].toString();
        if (title.length > 50) {
          title = title.substring(0, 50);
        }

        formKey.currentState!.patchValue({"title": title, "youtube": youtube});
        Get.snackbar("Success", "Title Fetched Successfully!");
        setState(() {});
        return true;
      }
      throw Exception(data.reasonPhrase);
    } on Exception catch (_) {
      log("Invalid url");
      Get.snackbar("Error", "Invalid Youtube URL");
    }
    // isValid = false;
    setState(() {});
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:
            Text("${widget.update != null ? 'Update' : 'Add'} Youtube Video"),
      ),
      body: FormBuilder(
        key: formKey,
        initialValue: widget.update ?? {},
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            const SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
              name: "title",
              maxLength: 50,
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(),
                FormBuilderValidators.maxLength(50),
              ]),
              decoration: inputDecoration(hintText: "Title", isRequired: true),
            ),
            const SizedBox(
              height: 20,
            ),
            FormBuilderTextField(
                contextMenuBuilder: formContextMenu,
                name: "youtube",
                onChanged: (s) {
                  isValid = false;
                  setState(() {});
                },
                decoration: inputDecoration(
                    hintText: "Youtube",
                    isRequired: true,
                    suffix: IconButton(
                        splashRadius: 30,
                        onPressed: () async {
                          isValidUrl();
                        },
                        icon: const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 30,
                        ))),
                validator: (String? url) {
                  if (url == null) {
                    return "This field can't be empty";
                  }
                  return FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.url(
                        errorText: "Enter a valid Youtube URL",
                        requireProtocol: true,
                        hostWhitelist: [
                          'youtube.com',
                          "youtu.be",
                          'www.youtube.com'
                        ],
                        protocols: [
                          'https'
                        ]),
                  ]).call(url);
                }),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Paste Youtube URL and Click the button to get Title from YOUTUBE OR Add title Manually",
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            // if (isValid)
            YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: ytcontroller,
                ),
                builder: (context, player) {
                  return Column(
                    children: [
                      // some widgets
                      player,
                      //some other widgets
                    ],
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ApiController().documentSaveOrUpdate(formKey: formKey, filesKey: [])
          ],
        ),
      ),
    );
  }
}
