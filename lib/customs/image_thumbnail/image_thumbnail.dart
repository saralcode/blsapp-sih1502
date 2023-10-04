import 'dart:io';
import 'dart:typed_data';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:thumbnailer/thumbnailer.dart';

void addMemeTypes() {
  Thumbnailer.addCustomMimeTypesToIconDataMappings({
    "audio/mpeg": Icons.music_note,
    "video/mp4": Icons.video_collection_rounded
  });
}

List<String> alternate = ["image/svg+xml"];
List<String> images = [
  "image/jpeg",
  "image/png",
  "image/gif",
  "image/webp",
  "image/bmp",
  "image/wbmp"
];
List<String> videoTypes = ["video/mp4"];
typedef DataResolver = Future<Uint8List> Function();
Widget showThumbnail(
    {required mimeType,
    DataResolver? dataResolver,
    required String? path,
    required isNetwork}) {
  return AspectRatio(
      aspectRatio: 1 / 1,
      child: mimeType.startsWith("video")
          ? Image.asset(
              "assets/videothumbnail.png",
              fit: BoxFit.scaleDown,
              width: 40,
              height: 80,
            )
          : images.contains(mimeType)
              ? path == null
                  ? const CircularProgressIndicator()
                  : isNetwork
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ExtendedImage.network(
                            path,
                            fit: BoxFit.cover,
                            cache: true,
                            // border: Border.all(color: Colors.red, width: 1.0),
                            // shape: boxShape,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(30.0)),
                            //cancelToken: cancellationToken,
                          ))
                      : Image.file(
                          File(path),
                          fit: BoxFit.cover,
                        )
              : Thumbnail(
                  mimeType: mimeType == null || alternate.contains(mimeType)
                      ? "not/f"
                      : mimeType,
                  onlyIcon: true,
                  dataResolver: dataResolver,
                  widgetSize: 100,
                  decoration: WidgetDecoration(
                    // backgroundColor: Colors.blueAccent,
                    iconColor: Colors.red,
                  ),
                ));
}
