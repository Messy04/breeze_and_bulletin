import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/constants/spacing.dart';
import 'package:breeze_and_bulletin/generated/l10n.dart';
import 'package:flutter/material.dart';

class NewsRowWidget extends StatelessWidget {
  final String title;

  const NewsRowWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: SecondaryFont.instance.semiBold(
                size: Dimension.s28,
                color: Colors.black87,
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text(
                Strings.of(context).seeAll,
                style: PrimaryFont.instance.semiBold(
                  size: Dimension.s18,
                  color: AppColors.secondary,
                ),
              ),
            ),
            WidthBox.size2,
            Icon(
              Icons.arrow_right_alt_rounded,
              color: AppColors.secondary,
            )
          ],
        ),
        HeightBox.size16,
        const NewsPage(),
      ],
    );
  }
}

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final _controller = PageController(viewportFraction: 0.87);
  int _currentPage = 0;

  final children = [
    Container(
      color: AppColors.tertiary,
    ),
    Container(
      color: AppColors.secondary,
    ),
    Container(
      color: AppColors.primary,
    ),
    Container(
      color: AppColors.color818181,
    ),
    Container(
      color: AppColors.colorEEEEEE,
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 320 / 240,
      child: OverflowBox(
        maxWidth: MediaQuery.of(context).size.width,
        child: PageView.builder(
          controller: _controller,
          itemCount: children.length,
          itemBuilder: (context, index) {
            return Transform.scale(
              scale: (_currentPage == index) ? 1 : 0.9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimension.s8),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimension.s8),
                  child: children[index],
                ),
              ),
            );
          },
          onPageChanged: (index) {
            setState(() => _currentPage = index);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
