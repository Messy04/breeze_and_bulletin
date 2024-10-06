import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/constants/spacing.dart';
import 'package:breeze_and_bulletin/feature/home/presentation/widget/bottom_nav_bar.dart';
import 'package:breeze_and_bulletin/feature/home/presentation/widget/notification_widget.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_category_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_home_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/top_news_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/widget/news_category_widget.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/widget/top_news_widget.dart';
import 'package:breeze_and_bulletin/feature/home/presentation/widget/search_widget.dart';
import 'package:breeze_and_bulletin/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: Dimension.s32,
          left: Dimension.s16,
          right: Dimension.s16,
        ),
        child: BlocBuilder<NewsHomeBloc, NewsHomeState>(
          builder: (context, state) {
            if (state is NewsHomeInitial) {
              return Column(
                children: [
                  HeightBox.size48,
                  Row(
                    children: [
                      const Expanded(child: SearchWidget()),
                      WidthBox.size16,
                      const NotificationWidget(),
                    ],
                  ),
                  HeightBox.size24,
                  _newsCategoriesSection(context, state),
                  HeightBox.size16,
                  _topNewsSection(context, state),
                ],
              );
            }
            return Container();
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  Widget _topNewsSection(BuildContext context, NewsHomeInitial state) {
    _selectedCategory = state.category;
    context.read<TopNewsBloc>().add(GetTopHeadlinesEvent(
          category: _selectedCategory,
        ));
    return TopNewsWidget(
      title: _selectedCategory ?? Strings.of(context).trendingTitle,
    );
  }

  Widget _newsCategoriesSection(BuildContext context, NewsHomeInitial state) {
    context.read<NewsCategoryBloc>().add(GetNewsCategories());
    _selectedCategory = state.category;
    return SizedBox(
      height: Dimension.s50,
      child: NewsCategoryWidget(
        selectedCategory:
            _selectedCategory ?? Strings.of(context).trendingTitle,
        onSelection: (index, value) {
          context.read<NewsHomeBloc>().add(GetHomeNewsEvent(
                category: value,
              ));
        },
      ),
    );
  }
}
