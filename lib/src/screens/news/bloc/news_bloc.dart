import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial());

  Box tokensBox = Hive.box('tokens');

  @override
  Stream<NewsState> mapEventToState(
    NewsEvent event,
  ) async* {
    if (event is NewsInitial) {
      yield NewsLoading();
      Dio dio = Dio();
      Response response = await dio.get(
          "http://api.codeunion.kz/api/v1/restaurants/all?page=1&perPage=10",
          options: Options(
            headers: {'Authorization': 'Bearer ${tokensBox.get('access')}'},
          ));
      print(response.data);
      yield NewsLoaded();
    }
  }
}
