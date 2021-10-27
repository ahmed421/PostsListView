import 'dart:convert';


import 'package:chopper/chopper.dart';
import 'package:listview_bloc/posts/models/post.dart';

import 'generic_converter.dart';

part 'chopper_api.chopper.dart';

@ChopperApi()
abstract class ApiServices extends ChopperService
{
  static ApiServices createApiServices()
  {
    final client=ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      //flutter packages pub run build_runner watch
      services: [_$ApiServices()],
      converter: GenericConvertor(
        {
           PostModel: (json) =>PostModel.fromJson(json)
        }
      )


    );

    return _$ApiServices(client);


  }

  //get posts
  @Get(path:'/posts')
  Future<Response<List<PostModel>>> getPosts(
      @Query('_start' ) int start,

     @Query('_limit') int limit

      );
}
