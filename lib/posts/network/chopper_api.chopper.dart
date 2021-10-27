// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chopper_api.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$ApiServices extends ApiServices {
  _$ApiServices([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiServices;

  @override
  Future<Response<List<PostModel>>> getPosts(int start, int limit) {
    final $url = '/posts';
    final $params = <String, dynamic>{'_start': start, '_limit': limit};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<List<PostModel>, PostModel>($request);
  }
}
