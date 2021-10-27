part of 'post_bloc.dart';

@immutable
abstract class PostEvent extends Equatable
  {
  @override

  List<Object?> get props => [];

  }


  // Event to fetch new posts when user scrolling and ui need to fetch new posts
// PostBloc will be receiving PostEvents and converting them to PostStates
 class PostFetched extends PostEvent{}
