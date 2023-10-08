import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class CacheImage extends StatefulWidget {
  final String url;
  const CacheImage({super.key, required this.url});

  @override
  State<CacheImage> createState() => _CacheImageState();
}

class _CacheImageState extends State<CacheImage> with TickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
    // _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: generateRandomColor(),
      child: ExtendedImage.network(
        widget.url,
        cache: true,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              _controller.reset();
              return const Center(child: CircularProgressIndicator());

            ///if you don't want override completed widget
            ///please return null or state.completedWidget
            //return null;
            //return state.completedWidget;
            case LoadState.completed:
              _controller.forward();
              return FadeTransition(
                opacity: _controller,
                child: ExtendedRawImage(
                  fit: BoxFit.cover,
                  image: state.extendedImageInfo?.image,
                  // width: ScreenUtil.instance.setWidth(600),
                  // height: ScreenUtil.instance.setWidth(400),
                ),
              );

            case LoadState.failed:
              _controller.reset();
              return GestureDetector(
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.asset(
                      "assets/failed.jpg",
                      fit: BoxFit.fill,
                    ),
                    const Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Text(
                        "load image failed, click to reload",
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
                onTap: () {
                  state.reLoadImage();
                },
              );
          }
        },
      ),
    );
  }
}
