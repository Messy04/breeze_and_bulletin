import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/constants/spacing.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/widget/news_page_view_widget.dart';
import 'package:breeze_and_bulletin/generated/l10n.dart';
import 'package:flutter/material.dart';

class TopNewsWidget extends StatelessWidget {
  final String title;

  const TopNewsWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeading(context),
        HeightBox.size16,
        NewsPageView(),
      ],
    );
  }

  Widget _buildHeading(BuildContext context) {
    return Row(
      children: [
        Text(
          '$title News',
          style: SecondaryFont.instance.semiBold(
            size: Dimension.s28,
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
    );
  }
}
