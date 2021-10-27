
import 'package:http/http.dart';
import 'package:listview_bloc/posts/models/post.dart';

class HttpApiServices
{
  final Client httpClient;

  HttpApiServices({required this.httpClient});

  Future<Response> fetchPosts([int startIndex=0,int LIMIT=0]) async{
    final response =await httpClient.get(
      Uri.http(
        'jsonplaceholder.typicode.com'
        ,'/posts',
        <String,String>{'_start' :'$startIndex','_limit' :'$LIMIT'},
      ),
    );
    return response;
  }
}