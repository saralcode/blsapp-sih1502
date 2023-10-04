import 'package:bls/pages/reels/doubts/doubt_card.dart';
import 'package:bls/pages/reels/doubts/doubts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoubtsPage extends StatefulWidget {
  final String postId;
  const DoubtsPage({Key? key, required this.postId}) : super(key: key);

  @override
  DoubtsPageState createState() => DoubtsPageState();
}

class DoubtsPageState extends State<DoubtsPage> {
  final TextEditingController commentEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoubtController>(builder: (state) {
      return Scaffold(
        body: Container(
          margin: const EdgeInsets.only(
            top: 40,
            left: 20,
            right: 20,
          ),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey, width: 3))),
          height: Get.size.height * 0.7,
          // color: Colors.white,
          child: ListView.builder(
            itemCount: state.comments.length,
            itemBuilder: (ctx, index) => DoubtCard(
              doubt: state.comments[index],
            ),
          ),
        ),
        bottomNavigationBar: Row(
          children: [
            const CircleAvatar(
              // backgroundImage: NetworkImage(user.photoUrl),
              radius: 18,
              child: Text("S"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: TextFormField(
                  controller: commentEditingController,
                  decoration: InputDecoration(
                    suffix: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Post',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                    hintText: 'Comment as Sonu',
                    // border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
