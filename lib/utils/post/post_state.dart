enum PostType { youtube, pdf, images }

class Post {
  int id;
  String role;
  PostType type;
  int organizationId;
  int courseId;
  int bookId;
  int chapterId;
  String topics;
  String postId;
  String title;
  String description;
  List<String> images;
  String? link;
  List<String> likes;

  List<Comment> comments;

  Post(
    this.id,
    this.role,
    this.type,
    this.organizationId,
    this.courseId,
    this.bookId,
    this.chapterId,
    this.topics,
    this.postId,
    this.title,
    this.description,
    this.images,
    this.link,
    this.likes,
    this.comments,
  );
}

class Comment {
  String commentId;
  String message;
  List<Reply> replies;

  Comment(this.commentId, this.message, this.replies);
}

class Reply {
  String replyId;
  String replyMessage;

  Reply(this.replyId, this.replyMessage);
}
