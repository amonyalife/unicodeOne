import 'dart:async';

import 'package:amonyatest/src/common/models/news_Model.dart';
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
      try {
        Dio dio = Dio();
        Response response1 = await dio.get(
            "http://api.codeunion.kz/api/v1/restaurants/all?page=1&perPage=10",
            options: Options(headers: {
              'Authorization': 'Bearer ${tokensBox.get('access')}',
            }));
        print(response1.data);
        NewsModel newsModel = NewsModel.fromJson(response1.data);
        yield NewsLoaded(newsModel);
      } on DioError catch (e) {
        yield NewsFailed(message: 'данные не загрузились');
        throw e;
      } catch (e) {
        yield NewsFailed(message: 'Произошла ошибка');
        throw e;
      }
    }
  }
}
