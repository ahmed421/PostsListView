

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_bloc/posts/bloc/post_bloc.dart';
import 'package:listview_bloc/posts/widgets/bottom_loader.dart';
import 'package:listview_bloc/posts/widgets/post_list_item.dart';
import 'package:provider/src/provider.dart';

class PostsList extends StatefulWidget
{
  @override
  _PostsListState createState() => _PostsListState();

}

class _PostsListState extends State<PostsList>
{
  //create scrollController to listen to  know if we reach to the bottom of screen ot not to fetch new posts
  final _scrollController= ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(_onscroll);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController..removeListener(_onscroll)..dispose();

    super.dispose();

  }








  @override
  Widget build(BuildContext context) {
      return BlocBuilder<PostBloc,PostState>(
          builder: (context,state){
            switch(state.status)
            {
              case PostStatus.failure:
                // case if failed happened
                  return const Center(child: Text('Failed To Get Pots!!'),);
              case PostStatus.success:
                // case if success happened
                // if there no enough posts to display
                  if(state.posts.isEmpty) {
                    return const Center(child: Text('No Posts To Display!'),);
                  }
                  //if there is posts fetch from server and create listView to diplay this posts on it
                  return ListView.builder(
                      itemBuilder: (BuildContext context,int index)
                          {
                              return
                                  //condition
                                     index >=state.posts.length?
                                         BottomLoader():
                                         PostListItem(post: state.posts[index],);




                          },
                    itemCount: state.hasReachedMax?
                               state.posts.length:
                               state.posts.length+1,
                    controller: _scrollController,
                  );

              default:
                return const Center(child: CircularProgressIndicator(),);


            }
          }
      );


  }












  void _onscroll() {
  if(_isBottom)
    {
      context.read<PostBloc>().add(PostFetched());
    }
  }

  bool get _isBottom{
    if(!_scrollController.hasClients) return false;
    final maxScroll=_scrollController.position.maxScrollExtent;
    final currentScroll=_scrollController.offset;
    return currentScroll >= (maxScroll*0.9);
  }
}