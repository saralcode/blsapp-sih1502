import 'package:bls/pages/reels/doubts/doubts_controller.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DoubtCard extends StatelessWidget {
  final Doubt doubt;
  const DoubtCard({Key? key, required this.doubt}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundImage: doubt.image != null
                  ? NetworkImage(
                      doubt.image!,
                    )
                  : null,
              radius: 18,
              child: const Text("S"),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.grey.shade800,
                        ),
                        children: [
                          TextSpan(
                              text: doubt.username,
                              style: const TextStyle(
                                fontSize: 16,
                                height: 2,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                            text: "\n${doubt.text}",
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        DateFormat.yMMMd().format(
                          DateTime.now(),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.favorite,
                size: 16,
                color: Colors.red,
              ),
            )
          ],
        ),
        if (doubt.replies!.isNotEmpty)
          TextButton(
            onPressed: () {},
            child: const Text("View Replies"),
          )
      ],
    );
  }
}
