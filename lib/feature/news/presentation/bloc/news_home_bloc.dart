import 'package:breeze_and_bulletin/core/utils/app_typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'news_home_event.dart';

part 'news_home_state.dart';

class NewsHomeBloc extends Bloc<NewsHomeEvent, NewsHomeState> {
  NewsHomeBloc() : super(NewsHomeInitial()) {
    on<GetHomeNewsEvent>(_onGetHomeNewsEvent);
  }

  void _onGetHomeNewsEvent(
    GetHomeNewsEvent event,
    Emitter<NewsHomeState> emit,
  ) {
    emit(NewsHomeInitial(category: event.category));
  }
}
