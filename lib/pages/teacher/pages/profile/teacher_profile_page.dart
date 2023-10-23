import 'package:bls/customs/design_button/design_button.dart';
import 'package:bls/pages/organization/pages/profile/profile_component/profile_card.dart';
import 'package:bls/utils/user/user_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherProfilePage extends StatefulWidget {
  const TeacherProfilePage({super.key});

  @override
  State<TeacherProfilePage> createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserController>(builder: (state) {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Teacher Profile"),
        ),
        extendBodyBehindAppBar: true,
        body: StreamBuilder(
            stream: null,
            builder: (context, snapshot) {
              return ListView(children: [
                const ProfileCard(
                  files: [
                    "https://images.unsplash.com/photo-1494949649109-ecfc3b8c35df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1932&q=80"
                  ],
                  name: "Teacher Name",
                  onlyProfile: false,
                ),
                const SizedBox(
                  height: 100,
                ),
                GridView(
                  padding: const EdgeInsets.all(8),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: context.isLandscape ? 3 : 2,
                  ),
                  children: [
                    designButton(
                        text: "Update Profile",
                        begin: Colors.orange,
                        end: Colors.orangeAccent.shade700,
                        onClick: () {
                          // Get.to(() => UpdateProfile(data: data));
                        }),
                    designButton(
                        text: "Social Media Links",
                        begin: Colors.blue,
                        end: Colors.blueAccent.shade700,
                        onClick: () {
                          // Get.to(() => UpdateSocialMedia(
                          //       data: data,
                          //     ));
                        }),
                    designButton(
                        text: "Settings",
                        begin: Colors.pink,
                        end: Colors.pinkAccent.shade700,
                        onClick: () {}),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                signOutButton(),
              ]);
            }),
      );
    });
  }
}

Widget signOutButton() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: FloatingActionButton.extended(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        label: const Text("Signout")),
  );
}
