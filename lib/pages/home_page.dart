import 'package:flutter/material.dart';
import 'package:forum_app/components/button_component.dart';
import 'package:forum_app/components/post_component.dart';
import 'package:forum_app/components/posts_component.dart';
import 'package:forum_app/controller/post_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final PostController _postsController = Get.put(PostController());
  final TextEditingController _postController = TextEditingController();
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                PostComponent(
                  controller: widget._postController,
                  hintText: 'What do you want to ask?',
                  border: Border.all(color: Colors.black),
                  backgroundColor: Colors.grey[200],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                ButtonComponent(
                  onPressed: () {},
                  width: 200.0,
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  color: Colors.grey,
                  child: const Text('Post'),
                ),
                const Divider(thickness: 2.0),
                const Center(child: Text('Posts')),
                const PostsComponent(
                  name: 'Trinh',
                  email: 'duongquangtrinh8@gmail.com',
                  content: 'This is pretty new postljhkfioudsaikgjfsahlfhkjashlfhsakjfdsjklkfahjskfhfsakhffhsf',
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(height: 20.0,),
          
              ],
            ),
          ),
        ));
  }
}
