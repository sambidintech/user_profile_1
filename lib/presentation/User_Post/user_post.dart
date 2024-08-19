import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:user_profile/configuration/assets/url.dart';
import 'package:user_profile/presentation/User_Post/post.dart';
import 'package:user_profile/presentation/provider/post_provider.dart';

class UserPost extends StatefulWidget {
  const UserPost({super.key});

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {


  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse(Url.post));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }


  @override
  Widget build(BuildContext context) {
    var fav=context.watch<PostProvider>().favList;

    return Scaffold(
      appBar: AppBar(
        title:  Text('User Posts (${fav.length})'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final posts = snapshot.data!;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.blueAccent,

                  ),),
                  subtitle: Text(post.description,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,

                      )),
                  trailing: GestureDetector(
                      onTap: (){
                        if(!fav.contains(index)){
                          context.read<PostProvider>().addtoList(index);
                          print(fav);
                        }
                        else{
                          context.read<PostProvider>().removeFav(index);
                        }
                      },
                      child: Icon(Icons.favorite,
                          color: fav.contains(index)?Colors.red:Colors.grey,)),
                );

              },
            );

          }
        },
      ),

    );
  }

}