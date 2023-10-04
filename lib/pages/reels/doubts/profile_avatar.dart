import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String? image;
  final String username;
  const ProfileAvatar({super.key, this.image, required this.username});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundImage: image != null
          ? NetworkImage(
              image!,
            )
          : null,
      radius: 18,
      child: Text(username.substring(0, 1)),
    );
  }
}
