import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ShowYoutubePost extends StatefulWidget {
  final String url;
  const ShowYoutubePost({super.key, required this.url});

  @override
  State<ShowYoutubePost> createState() => _ShowYoutubePostState();
}

class _ShowYoutubePostState extends State<ShowYoutubePost> {
  late YoutubePlayerController ytcontroller;
  bool showappbar = true;
  @override
  void initState() {
    ytcontroller = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(widget.url)!,
        flags:
            const YoutubePlayerFlags(autoPlay: true, loop: false, mute: false));
    super.initState();
  }

  @override
  void dispose() {
    ytcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: !showappbar
          ? null
          : AppBar(
              title: const Text("Youtube Player"),
            ),
      body: YoutubePlayerBuilder(
          onEnterFullScreen: () {
            setState(() {
              showappbar = false;
            });
          },
          onExitFullScreen: () async {
            SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
              SystemUiOverlay.top,
            ]);
            setState(() {
              showappbar = true;
            });
          },
          player: YoutubePlayer(
            controller: ytcontroller,
            onReady: () {
              setState(() {});
            },
          ),
          builder: (context, player) {
            YoutubeMetaData metaData = ytcontroller.value.metaData;
            return Column(
              children: [
                // some widgets
                player,
                Card(
                  child: ListTile(
                    title: Text(metaData.title),
                    subtitle: Text(metaData.author),
                  ),
                )
                //some other widgets
              ],
            );
          }),
      bottomNavigationBar: !showappbar || !ytcontroller.value.isReady
          ? null
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.pink,
                onPressed: () {},
                label: const Text("Exit & Save duration"),
              ),
            ),
    );
  }
}
