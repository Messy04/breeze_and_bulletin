import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCategoryBloc extends Bloc<NewsHomeEvent, NewsHomeState> {
  NewsCategoryBloc() : super(NewsLoadingState()) {
    on<GetNewsCategories>(_onGetNewsCategories);
    on<SelectCategoryEvent>(_onSelectCategoryEvent);
  }

  void _onGetNewsCategories(
    GetNewsCategories event,
    Emitter<NewsHomeState> emit,
  ) {
    emit(ShowNewsCategories(categories: _getCategories()));
  }

  void _onSelectCategoryEvent(
    SelectCategoryEvent event,
    Emitter<NewsHomeState> emit,
  ) {
    emit(ShowNewsCategories(
      categories: _getCategories(),
    ));
  }

  Map<int, String?> _getCategories() {
    return {
      0: null,
      1: 'Sports',
      2: 'Technology',
      // 3: 'Finance',
      3: 'Science',
      4: 'Health',
      // 6: 'Arts',
    };
  }
}
