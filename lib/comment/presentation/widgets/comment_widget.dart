import 'package:flutter/material.dart';

class CommentItemWidget extends StatefulWidget {
  const CommentItemWidget({super.key});

  @override
  State<CommentItemWidget> createState() => _CommentItemWidgetState();
}

class _CommentItemWidgetState extends State<CommentItemWidget> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
            ),
            Text(
              'Comment',
            ),
          ],
        ),
      ],
    );
  }
}
