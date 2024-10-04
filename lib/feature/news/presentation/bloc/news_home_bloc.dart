import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'news_home_event.dart';
part 'news_home_state.dart';

class NewsHomeBloc extends Bloc<NewsHomeEvent, NewsHomeState> {
  NewsHomeBloc() : super(NewsHomeInitial()) {
    on<NewsHomeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
