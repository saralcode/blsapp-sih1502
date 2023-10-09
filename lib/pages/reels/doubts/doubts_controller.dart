import 'package:get/get.dart';

class Doubt {
  String username;
  String text;
  bool solved;
  String? image;
  List<Doubt>? replies = [];

  Doubt(
      {required this.username,
      this.solved = false,
      required this.text,
      this.replies,
      this.image});
}

class DoubtController extends GetxController {
  final solvedDoubts = [
    Doubt(
        username: "Anurag",
        text:
            "What is the difference between the 'id' and 'class' attributes of HTML elements? ",
        solved: true,
        replies: [
          Doubt(username: "hello", text: "replies"),
          Doubt(username: "hello", text: "replies"),
          Doubt(username: "hello", text: "replies"),
        ]),
  ];
  final unSolvedDoubts = <Doubt>[
    Doubt(
        username: "Ankit",
        text: "How to create a hyperlink in HTML?",
        replies: [
          Doubt(username: "hello", text: "replies"),
          Doubt(username: "hello", text: "replies"),
          Doubt(username: "hello", text: "replies"),
        ]),

    // Doubt(

    //   'User1',
    //   'This is the first comment.',
    //   [
    //     Doubt('User2', 'Nice work!'),
    //     Doubt('User3', 'I like it.'),
    //     Doubt('User4', 'Thanks, User2!'),
    //   ],
    // ),
  ].obs;

  void addDoubt(Doubt comment) {
    // comments.add(comment);
  }
}
