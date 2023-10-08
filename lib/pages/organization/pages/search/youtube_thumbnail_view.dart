import 'package:bls/pages/organization/pages/home/courses_or_classes/chapters/topics/study_materials/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeThumbnail extends StatefulWidget {
  final String url;
  const YoutubeThumbnail({super.key, required this.url});

  @override
  State<YoutubeThumbnail> createState() => _YoutubeThumbnailState();
}

class _YoutubeThumbnailState extends State<YoutubeThumbnail> {
  // Future<String?> getdata() async {
  //   try {
  //     Uri uri = Uri.parse(
  //         "https://www.youtube.com/oembed?url=${widget.url}&format=json");
  //     http.Response res = await http.get(uri);
  //     if (res.statusCode == 200) {
  //       Map data = jsonDecode(res.body);
  //       return data["thumbnail_url"];
  //     }
  //   } catch (e) {}
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return CacheImage(
        url:
            "https://i.ytimg.com/vi/${YoutubePlayer.convertUrlToId(widget.url)}/hqdefault.jpg");
  }
}
