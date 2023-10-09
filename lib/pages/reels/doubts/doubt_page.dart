import 'package:bls/customs/input_decoration/input_decoration.dart';
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

class DoubtsPageState extends State<DoubtsPage>
    with SingleTickerProviderStateMixin {
  final TextEditingController commentEditingController =
      TextEditingController();
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 2);
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DoubtController>(builder: (state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Doubts"),
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: [
              Tab(
                child: TextButton.icon(
                    onPressed: null,
                    style: const ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    icon: const Icon(
                      Icons.published_with_changes,
                    ),
                    label: const Text(
                      "Solved",
                    )),
              ),
              Tab(
                child: TextButton.icon(
                    onPressed: null,
                    style: const ButtonStyle(
                      iconColor: MaterialStatePropertyAll(Colors.white),
                      foregroundColor: MaterialStatePropertyAll(Colors.white),
                    ),
                    icon: const Icon(
                      Icons.unpublished_outlined,
                    ),
                    label: const Text("Unsolved")),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.solvedDoubts.length,
                itemBuilder: (ctx, index) => DoubtCard(
                      doubt: state.solvedDoubts[index],
                    )),
            ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: state.unSolvedDoubts.length,
                itemBuilder: (ctx, index) => DoubtCard(
                      doubt: state.unSolvedDoubts[index],
                    )),
          ],
        ),
        bottomSheet: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: commentEditingController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 4,
            maxLength: 200,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(left: 5, right: 8),
                  child: CircleAvatar(
                    // backgroundImage: NetworkImage(user.photoUrl),
                    backgroundColor: Colors.deepOrange,
                    foregroundColor: Colors.white,

                    radius: 16,
                    child: Text("S"),
                  ),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {},
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.attach_file_rounded,
                          color: Colors.pink,
                        )),
                    IconButton(
                        onPressed: () {},
                        constraints: const BoxConstraints(),
                        icon: const Icon(
                          Icons.send_outlined,
                          color: Colors.blue,
                        ))
                  ],
                ),
                hintText: 'Ask Your Doubt',
                border: border(),
                contentPadding: const EdgeInsets.only(
                    top: 0, bottom: 10, left: 5, right: 5)),
          ),
        ),
      );
    });
  }
}
