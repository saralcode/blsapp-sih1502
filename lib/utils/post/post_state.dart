enum PostType { youtube, pdf, images }

class Post {
  int id;
  String role;
  PostType type;
  int organizationId;
  int courseId;
  int bookId;
  int chapterId;
  List<String>? topics;
  String title;
  String description;
  List<String>? images;
  String? link;
  List<int> likes;

  List<Doubt> doubts;

  Post({
    required this.id,
    required this.role,
    required this.type,
    required this.organizationId,
    required this.courseId,
    required this.bookId,
    required this.chapterId,
    this.topics,
    required this.title,
    required this.description,
    required this.images,
    required this.link,
    required this.likes,
    required this.doubts,
  });
}

class Doubt {
  String doubtsId;
  String message;
  List<Reply> replies;

  Doubt({
    required this.doubtsId,
    required this.message,
    required this.replies,
  });
}

class Reply {
  String replyId;
  String replyMessage;

  Reply({required this.replyId, required this.replyMessage});
}
