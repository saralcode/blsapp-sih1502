import 'package:bls/utils/post/post_state.dart';

List<Post> posts = List.generate(20, (index) {
  return Post(
    index + 1,
    'Role ${(index % 3) + 1}',
    PostType.values[index % PostType.values.length],
    (index % 5) + 1,
    (index % 6) + 1,
    (index % 7) + 1,
    (index % 8) + 1,
    'Topics ${index + 1}',
    '_id ${(index % 10) + 1}',
    'Title ${(index % 20) + 1}',
    'Description ${(index % 20) + 1}',
    ['Image1', 'Image2'],
    (index % 2 == 0) ? 'Link ${(index % 5) + 1}' : null,
    ['User1', 'User2'],
    List.generate(3, (commentIndex) {
      return Comment(
        'CommentId ${(index % 20) + 1}_$commentIndex',
        'Comment ${(index % 20) + 1}_$commentIndex',
        List.generate(2, (replyIndex) {
          return Reply(
            'ReplyId ${(index % 20) + 1}_$commentIndex$replyIndex',
            'Reply ${(index % 20) + 1}_$commentIndex$replyIndex',
          );
        }),
      );
    }),
  );
});
