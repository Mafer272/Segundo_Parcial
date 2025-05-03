import 'package:flutter/material.dart';
import '../../core/api/api_service.dart';
import '../../widgets/post_card.dart';
import 'new_post_page.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final ApiService _apiService = ApiService();
  late Future<List<dynamic>> _posts;

  @override
  void initState() {
    super.initState();
    _posts = _apiService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Publicaciones')),
      body: FutureBuilder<List<dynamic>>(
        future: _posts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!
                  .map((post) => PostCard(post: post))
                  .toList(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NewPostPage()),
          );
          if (result == true) {
            setState(() {
              _posts = _apiService.fetchPosts();
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
