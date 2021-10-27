// Our presentation layer will need to have several pieces of information in order to properly lay itself out:
//
// 1) PostInitial- will tell the presentation layer it needs to render a loading indicator while the initial batch of posts are loaded
//
// 2) PostSuccess- will tell the presentation layer it has content to render
//       **posts- will be the List<Post> which will be displayed
//       **hasReachedMax- will tell the presentation layer whether or not it has reached the maximum number of posts
// 3) PostFailure- will tell the presentation layer that an error has occurred while fetching posts


part of 'post_bloc.dart';

enum PostStatus{intitial,success,failure}

@immutable
 class PostState extends Equatable {
  const PostState({this.status=PostStatus.intitial, this.posts=const <PostModel>[], this.hasReachedMax=false});
  PostState copyWith({
      PostStatus? status,
      List<PostModel>? posts,
      bool? hasReachedMax
  }){
    return PostState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  final PostStatus status;
  final List<PostModel> posts;
  final bool hasReachedMax;

  @override
  String toString() {
    // TODO: implement toString
    return '''poststate{status: $status, hasReachMax : $hasReachedMax ,posts:${posts.length} ''';
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,posts,hasReachedMax];


}


