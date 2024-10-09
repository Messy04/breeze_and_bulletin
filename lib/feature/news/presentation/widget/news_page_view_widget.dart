import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/resources/widgets/shimmer_loading.dart';
import 'package:breeze_and_bulletin/core/utils/app_extensions.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_home_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/top_news_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsPageView extends StatelessWidget {
  NewsPageView({super.key});

  final _controller = PageController(viewportFraction: 1);
  final double imageHeight = 200;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopNewsBloc, NewsHomeState>(
      buildWhen: (previous, current) =>
          current is NewsLoadingState || current is ShowArticlesState,
      builder: (context, state) {
        if (state is ShowArticlesState) {
          return AspectRatio(
            aspectRatio: 320 / 275,
            child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _controller,
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: Dimension.s16,
                    ),
                    child: Column(
                      children: [
                        _buildImage(context, index, state),
                        4.height,
                        _buildArticleBasicInfo(state, index),
                        8.height,
                        Text(
                          state.articles[index].title ?? '',
                          style: SecondaryFont.instance.bold(
                            size: Dimension.s20,
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        }
        return _buildShimmerLoading(context);
      },
    );
  }

  Widget _buildArticleBasicInfo(ShowArticlesState state, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'by ${state.articles[index].author ?? 'Author'}',
            style: PrimaryFont.instance.bold(),
          ),
        ),
        16.width,
        Text(
          getFormattedDate(state.articles[index].publishedAt).ddMMMyyyy(),
          style: PrimaryFont.instance.bold(),
        ),
      ],
    );
  }

  DateTime getFormattedDate(String? date) {
    final now = DateTime.now();
    final formatted = DateTime.parse(date ?? now.toString());
    return formatted;
  }

  Widget _buildImage(BuildContext context, int index, ShowArticlesState state) {
    return SizedBox(
      height: imageHeight,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimension.s8),
        child: CachedNetworkImage(
          imageUrl: state.articles[index].urlToImage ?? '',
          fit: BoxFit.cover,
          errorWidget: (context, str, obj) {
            return const Icon(Icons.error_outline_rounded);
          },
        ),
      ),
    );
  }

  Widget _buildShimmerLoading(BuildContext context) {
    return ShimmerLoading(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 320 / imageHeight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.circular(Dimension.s8),
              ),
            ),
          ),
          4.height,
          Row(
            children: [
              Container(
                color: Colors.white,
                height: Dimension.s20,
                width: Dimension.s100,
              ),
              const Spacer(),
              Container(
                color: Colors.white,
                height: Dimension.s20,
                width: Dimension.s100,
              ),
            ],
          ),
          16.height,
          Container(
            color: Colors.white,
            height: Dimension.s48,
            width: MediaQuery.of(context).size.width,
          ),
        ],
      ),
    );
  }
}
