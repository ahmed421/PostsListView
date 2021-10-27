

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:listview_bloc/app.dart';
import 'package:listview_bloc/posts/bloc/post_bloc.dart';
import 'package:listview_bloc/posts/network/http_api_services.dart';
import 'package:listview_bloc/posts/repository/posts_repository.dart';
import 'package:listview_bloc/posts/view/posts_list.dart';

class PostsPage extends StatelessWidget
{

  /*
  * In our PostsPage widget, we use BlocProvider to create and provide an instance of PostBloc to the subtree.
  *  Also, we add a PostFetched event so that when the app loads, it requests the initial batch of Posts.
  * */
  @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),

        ),
        body: BlocProvider(
            //create: (_)=> PostBloc(httpClient: Client())..add(PostFetched()),
          create: (_)=> PostBloc(repository: PostsRepository()),
          child: PostsList(),
        ),
      );
  }
  
}