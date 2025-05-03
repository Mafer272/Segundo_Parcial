import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final Map<String, dynamic> post;

  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(post['title'], style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(post['body']),
            const SizedBox(height: 8),
            Text('Usuario ID: ${post['userId']}'),
          ],
        ),
      ),
    );
  }
}
