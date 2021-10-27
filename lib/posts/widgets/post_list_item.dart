

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listview_bloc/posts/models/post.dart';

class PostListItem extends StatelessWidget
{
  final PostModel post;

  const PostListItem({Key? key,required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme=Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${post.id}',style: textTheme.caption),
        title: Text(post.title),
        isThreeLine: true,
        subtitle: Text(post.body),
        dense: true,
      ),
    );
  }

}