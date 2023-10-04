import 'package:get/get.dart';

class Doubt {
  String username;
  String text;
  String? image;
  List<Doubt>? replies = [];

  Doubt({required this.username, required this.text, this.replies, this.image});
}

class DoubtController extends GetxController {
  final comments = <Doubt>[
    Doubt(username: "sonu", text: "This is a comment", replies: [
      Doubt(username: "hello", text: "replies"),
      Doubt(username: "hello", text: "replies"),
      Doubt(username: "hello", text: "replies"),
    ])
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
    comments.add(comment);
  }
}
