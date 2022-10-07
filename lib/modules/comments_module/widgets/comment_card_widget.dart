import 'package:flutter/cupertino.dart';

class CommentCard extends StatelessWidget {
  final dynamic snap;

  const CommentCard({Key? key, required this.snap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(snap["title"])),
      ],
    );
  }
}
