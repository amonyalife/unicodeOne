part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class NewsLoading extends NewsState {}

class NewsLoaded extends NewsState {
  final NewsModel restaurants;

  NewsLoaded(this.restaurants);
}

class NewsFailed extends NewsState {
  final String? message;

  NewsFailed({required this.message});
}
