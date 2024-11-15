import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
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
  final double imageWidth = 320;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TopNewsBloc, NewsHomeState>(
      buildWhen: (previous, current) =>
          current is NewsLoadingState || current is ShowArticlesState,
      builder: (context, state) {
        if (state is ShowArticlesState) {
          return AspectRatio(
            aspectRatio: imageWidth / 275,
            child: OverflowBox(
              maxWidth: MediaQuery.of(context).size.width,
              child: PageView.builder(
                controller: _controller,
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  return _PageViewItem(
                    imageHeight: imageHeight,
                    state: state,
                    index: index,
                  );
                },
              ),
            ),
          );
        }
        return _NewsShimmerWidget(
          imageWidth: imageWidth,
          imageHeight: imageHeight,
        );
      },
    );
  }
}

class _PageViewItem extends StatelessWidget {
  const _PageViewItem({
    required this.imageHeight,
    required this.state,
    required this.index,
  });

  final double imageHeight;
  final ShowArticlesState state;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: Dimension.s16,
      ),
      child: Column(
        children: [
          _HeadlineImageWidget(
            imageHeight: imageHeight,
            imageUrl: state.articles[index].urlToImage,
          ),
          4.height,
          _HeadlineBasicInfoWidget(
            author: state.articles[index].author,
            publishedAt: state.articles[index].publishedAt,
          ),
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
  }
}

class _NewsShimmerWidget extends StatelessWidget {
  const _NewsShimmerWidget({
    required this.imageWidth,
    required this.imageHeight,
  });

  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: imageWidth / imageHeight,
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

class _HeadlineBasicInfoWidget extends StatelessWidget {
  const _HeadlineBasicInfoWidget({
    this.publishedAt,
    this.author,
  });

  final String? publishedAt;
  final String? author;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            'by ${author ?? 'Author'}',
            style: PrimaryFont.instance.bold(),
          ),
        ),
        16.width,
        Text(
          getFormattedDate(publishedAt).ddMMMyyyy(),
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
}

class _HeadlineImageWidget extends StatelessWidget {
  const _HeadlineImageWidget({
    required this.imageHeight,
    this.imageUrl,
  });

  final double imageHeight;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: MediaQuery.of(context).size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimension.s8),
        child: CachedNetworkImage(
          imageUrl: imageUrl ?? '',
          fit: BoxFit.cover,
          errorWidget: (context, str, obj) {
            return Container(
              color: AppColors.shimmerBase,
              child: const Icon(
                Icons.error_outline_rounded,
              ),
            );
          },
          placeholder: (context, str) {
            return ShimmerLoading(
              child: Container(
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
