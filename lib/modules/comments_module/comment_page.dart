import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro_nerd_teacher/modules/comments_module/widgets/comment_card_widget.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('testModel')
                  .snapshots(),
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  if (!snapshot.hasData) {
                    return Container(
                      margin: const EdgeInsets.all(20),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }
                }

                if (snapshot.connectionState == ConnectionState.active) {
                  final documents = snapshot.data!.docs
                      .map((e) => e.data() as Map<String, dynamic>)
                      .toList();

                  return Expanded(
                    child: ListView.builder(
                      reverse: true,
                      itemCount: documents.length,
                      itemBuilder: (_, index) => CommentCard(
                        snap: documents[index],
                      ),
                    ),
                  );
                }

                return Container(
                  margin: const EdgeInsets.all(20),
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
