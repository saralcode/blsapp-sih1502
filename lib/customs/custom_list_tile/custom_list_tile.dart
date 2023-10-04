import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

Widget customListTile(
    {required Function() onTap,
    required String title,
    required String subtitle,
    String? imagePath}) {
  return ListTile(
    onTap: onTap,
    leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: imagePath == null
            ? const Icon(
                Icons.person,
                size: 35,
              )
            : ExtendedImage.network(
                imagePath,
                fit: BoxFit.cover,
                cache: true,
                // border: Border.all(color: Colors.red, width: 1.0),
                // shape: boxShape,
                borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                //cancelToken: cancellationToken,
              )),
    title: Text(title),
    subtitle: Text(subtitle),
  );
}
