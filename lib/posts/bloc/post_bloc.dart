import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:listview_bloc/posts/models/post.dart';
import 'package:listview_bloc/posts/repository/posts_repository.dart';
import 'package:meta/meta.dart';
import 'package:stream_transform/stream_transform.dart';

part 'post_event.dart';
part 'post_state.dart';

//our PostBloc will be taking PostEvents as input and outputting PostStates.

const LIMIT=15;
const durationTime=Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}


class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc({required this.repository}/*{required this.httpClient}*/) : super(const PostState())
  {
    /// TODO: register on<PostFetched> event
    on<PostFetched>(
        _onPostFetched,
        transformer:throttleDroppable(durationTime)
    );

  }





  //final Client httpClient;
  final PostsRepository repository;

  Future<void> _onPostFetched(PostFetched event, Emitter<PostState> emit) async {
  // 1) if all posts in list get from server return.....
  if(state.hasReachedMax) return;
  try
      {

        // if postStatus is initial
        // get first Posts which start with initialze parameter [startIndex=0] in _fetchPosts() function
        //then emit the new state [SetState()] and make the current state is successful and give the list data
        // to state and make hasReachedMax is false
        if(state.status==PostStatus.intitial)
          {
                   // final posts=await _fetchPosts();
                    final posts=await repository.fetchPosts();
                    return emit(
                      state.copyWith(
                        status: PostStatus.success,
                        posts: posts,
                        hasReachedMax: false
                      )
                    );
          }


        // if postStatus is not  initial and is success
        // get the new Posts which start with  parameter [startIndex] in _fetchPosts() function which i give to it
        //check if new posts is empty that we reach to last posts in server so we should make hasReachedMax true
        //if we not we reach to last posts yet ,,, emit the new state [SetState()] and make the current state is successful and give the list data
        // to state and make hasReachedMax is false


        //final posts=await _fetchPosts(state.posts.length);
        final posts=await repository.fetchPosts(state.posts.length);
        posts!.isEmpty ?
            emit(state.copyWith(hasReachedMax: true))
            :
             emit(
               state.copyWith(
                 status: PostStatus.success,
                 posts: List.of(state.posts)..addAll(posts),
                 hasReachedMax: false
               )
             );



      }catch(_)
    {
      emit(state.copyWith(
        status: PostStatus.failure
      ));
    }

  }








/*
 // Request To Server
  // Fetch posts from http Services
  // this function will writen in Data Layer in Network
  Future<List<PostModel>> _fetchPosts([int startIndex=0]) async{
      final response =await httpClient.get(
        Uri.http(
          'jsonplaceholder.typicode.com'
        ,'/posts',
          <String,String>{'_start' :'$startIndex','_limit' :'$LIMIT'},
        ),
      );


      //Code Login in repository
      // this Condition will writen in Data Layer in repository
      if(response.statusCode==200)
        {
          print(response.body);
          final body= json.decode(response.body) as List;
          return body.map((dynamic json)
              {
                return PostModel(
                    id: json['id'] as int,
                    title: json['title'] as String,
                    body: json['body'] as String
                );
              }).toList();

        }
      throw Exception('Error happened in fetching posts');

  }*/
}
