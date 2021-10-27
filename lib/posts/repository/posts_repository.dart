

import 'dart:convert';

import 'package:http/http.dart';
import 'package:listview_bloc/posts/models/post.dart';
import 'package:listview_bloc/posts/network/chopper_api.dart';
import 'package:listview_bloc/posts/network/http_api_services.dart';
const LIMIT=15;

// class PostsRepository
// {
//   PostsRepository({required this.apiServices}/*{required this.httpClient}*/);
//   //final Client httpClient;
//   final HttpApiServices apiServices;
//
//   // Request To Server
//   // Fetch posts from http Services
//   // this function will writen in Data Layer in Network
//   Future<List<PostModel>> fetchPosts([int startIndex=0]) async{
//     // final response =await httpClient.get(
//     //   Uri.http(
//     //     'jsonplaceholder.typicode.com'
//     //     ,'/posts',
//     //     <String,String>{'_start' :'$startIndex','_limit' :'$LIMIT'},
//     //   ),
//     // );
//
//      final response= await apiServices.fetchPosts(startIndex,LIMIT);
//
//
//
//     //Code Login in repository
//     // this Condition will writen in Data Layer in repository
//     if(response.statusCode==200)
//     {
//       print(response.body);
//       final body= json.decode(response.body) as List;
//       return body.map((dynamic json)
//       {
//         return PostModel(
//             id: json['id'] as int,
//             title: json['title'] as String,
//             body: json['body'] as String
//         );
//       }).toList();
//
//     }
//     throw Exception('Error happened in fetching posts');
//
//   }
// }

class PostsRepository
{
  PostsRepository();
  Future<List<PostModel>?> fetchPosts([int startIndex=0]) async
  {
    try{

      final apiServices=ApiServices.createApiServices();
      final response= await apiServices.getPosts(startIndex, LIMIT);
      //logic code
      if(response.isSuccessful)
        {
          return response.body;
        }
      else
        {
          return [];
        }
    }catch(e)
    {
      print(e);
    }
  }
}