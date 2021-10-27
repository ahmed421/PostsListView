

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';
@JsonSerializable()
class PostModel extends Equatable
{

  const PostModel({required this.id,required this.title,required this.body});
  final int id;
  final String title;
  final String body;


  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);

  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  @override

  List<Object?> get props => [id,title,body];

}