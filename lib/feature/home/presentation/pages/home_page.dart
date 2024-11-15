import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/resources/injection_container.dart';
import 'package:breeze_and_bulletin/core/utils/app_extensions.dart';
import 'package:breeze_and_bulletin/feature/aqi/presentation/bloc/aqi_home_bloc.dart';
import 'package:breeze_and_bulletin/feature/aqi/presentation/widgets/aqi_home_widget.dart';
import 'package:breeze_and_bulletin/feature/home/presentation/widget/bottom_nav_bar.dart';
import 'package:breeze_and_bulletin/feature/home/presentation/widget/notification_widget.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_category_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_home_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/top_news_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/widget/news_category_widget.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/widget/top_news_widget.dart';
import 'package:breeze_and_bulletin/feature/weather/presentation/bloc/weather_home_bloc.dart';
import 'package:breeze_and_bulletin/feature/weather/presentation/widget/weather_home_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: Dimension.s32,
          left: Dimension.s16,
          right: Dimension.s16,
        ),
        child: SingleChildScrollView(
          child: BlocBuilder<NewsHomeBloc, NewsHomeState>(
            builder: (context, state) {
              if (state is NewsHomeInitial) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    48.height,
                    const Row(
                      children: [
                        // const Expanded(child: SearchWidget()),
                        // 16.width,
                        Spacer(),
                        NotificationWidget(),
                      ],
                    ),
                    24.height,
                    _NewsCategoryWidget(state),
                    16.height,
                    _TopNewsWidget(state),
                    16.height,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _WeatherWidget(),
                        _AirQualityWidget(),
                      ],
                    ),
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}

class _TopNewsWidget extends StatelessWidget {
  const _TopNewsWidget(this.state);

  final NewsHomeInitial state;

  @override
  Widget build(BuildContext context) {
    context
        .read<TopNewsBloc>()
        .add(GetTopHeadlinesEvent(category: state.category));
    return TopNewsWidget(
      title: state.category ?? LocaleKeys.trendingTitle.tr,
    );
  }
}

class _NewsCategoryWidget extends StatelessWidget {
  const _NewsCategoryWidget(this.state);

  final NewsHomeInitial state;

  @override
  Widget build(BuildContext context) {
    context.read<NewsCategoryBloc>().add(GetNewsCategories());
    return SizedBox(
      height: Dimension.s50,
      child: NewsCategoryWidget(
        selectedCategory: state.category ?? LocaleKeys.trendingTitle.tr,
        onSelection: (index, value) {
          context.read<NewsHomeBloc>().add(GetHomeNewsEvent(category: value));
        },
      ),
    );
  }
}

class _WeatherWidget extends StatelessWidget {
  const _WeatherWidget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherHomeBloc(
        getCurrentWeatherUsecase: injector(),
        getWeatherForecastUsecase: injector(),
      )..add(GetCurrentWeatherEvent()),
      child: const WeatherHomeWidget(),
    );
  }
}

class _AirQualityWidget extends StatelessWidget {
  const _AirQualityWidget();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AqiHomeBloc(
        getAQIUseCase: injector(),
      )..add(GetAirQualityEvent()),
      child: const AQIHomeWidget(),
    );
  }
}
