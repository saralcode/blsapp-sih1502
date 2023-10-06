import 'package:bls/utils/user/user_state.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCard extends StatelessWidget {
  final List<String> files;
  final String name;
  final bool onlyProfile;
  const ProfileCard(
      {super.key,
      required this.files,
      required this.name,
      required this.onlyProfile});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (snapshot) {
      String profile = "";
      String bg = files[0];

      if (onlyProfile) {
        return profilePicture(
            name: name, profile: profile, onlyProfile: onlyProfile);
      }
      return SizedBox(
        height: context.isPortrait ? 260 : 500,
        width: Get.size.width,
        child: Stack(
          children: [
            Positioned(
                child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                padding: bg.isNotEmpty
                    ? null
                    : const EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.pink, Colors.purple])),
                child: bg.isNotEmpty
                    ? ExtendedImage.network(
                        bg,
                        fit: BoxFit.cover,
                      )
                    : const Text(
                        "Organization Name",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: "serif",
                            fontWeight: FontWeight.bold),
                        textScaleFactor: 2,
                      ),
              ),
            )),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Transform.translate(
                    offset: const Offset(0, 70),
                    child: Text(
                      name,
                      textScaleFactor: 2,
                      style: const TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w800,
                          fontFamily: "serif"),
                    )),
              ),
            ),
            Positioned.fill(
              // bottom: -50,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 5),
                            blurRadius: 10,
                            color: Colors.grey)
                      ],
                      borderRadius: BorderRadius.circular(88)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: SizedBox(
                          height: 160,
                          width: 160,
                          child: profilePicture(
                              name: name,
                              profile: profile,
                              onlyProfile: onlyProfile))),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}

Widget profilePicture(
    {required String name,
    required String profile,
    required bool onlyProfile}) {
  if (profile.isEmpty) {
    return Center(
      child: Text(
        name.isNotEmpty ? name[0] : "🙂",
        style: const TextStyle(color: Colors.pink),
        textScaleFactor: onlyProfile ? 2 : 5,
      ),
    );
  }

  return ExtendedImage.network(
    profile,
    fit: BoxFit.cover,
  );
}
