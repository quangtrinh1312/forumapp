import 'package:flutter/material.dart';

class PostsComponent extends StatelessWidget {
  final String name;
  final String email;
  final String content;
  final Color? backgroundColor;
  final Border? border;
  final Widget? child;
  const PostsComponent({
    super.key,
    this.backgroundColor,
    this.border,
    this.child,
    this.name = 'Ops, name of this persion not found',
    this.email = 'Ops, email of this persion not found',
    this.content = 'Ops, Content not found',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: backgroundColor,
            border: border,
            borderRadius: const BorderRadius.all(Radius.circular(5.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              name,
              style: const TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            Text(
              email,
              style: const TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  fontSize: 17.0),
            ),
            const Divider(thickness: 2.0),
            Text(
              content,
              style: const TextStyle(fontSize: 18.0),
            ),
            const Divider(thickness: 2.0),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.thumb_up),
                ),
                const SizedBox(width: 20.0,),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.comment),
                )
              ],
            ),
          ],
        ));
  }
}
