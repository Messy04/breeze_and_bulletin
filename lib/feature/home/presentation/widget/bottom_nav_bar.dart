import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/constants/spacing.dart';
import 'package:breeze_and_bulletin/core/resources/app_images.dart';
import 'package:breeze_and_bulletin/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: Dimension.s8,
        horizontal: Dimension.s24,
      ),
      margin: const EdgeInsets.all(Dimension.s32),
      height: Dimension.s60,
      decoration: _navBarDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SvgPicture.asset(SvgImage.homeActive),
              HeightBox.size4,
              Text(
                Strings.of(context).homeTitle,
                style: PrimaryFont.instance.regular(),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(SvgImage.favouriteDefault),
              HeightBox.size4,
              Text(
                Strings.of(context).favouriteTitle,
                style: PrimaryFont.instance.regular(
                  color: AppColors.colorA6A6A6,
                ),
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(SvgImage.profileDefault),
              HeightBox.size4,
              Text(
                Strings.of(context).profileTitle,
                style: PrimaryFont.instance.regular(
                  color: AppColors.colorA6A6A6,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration _navBarDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(Dimension.s32),
      boxShadow: [
        BoxShadow(
          blurRadius: Dimension.s4,
          offset: const Offset(-2, 4),
          color: AppColors.color8C8C8C,
        )
      ],
    );
  }
}
