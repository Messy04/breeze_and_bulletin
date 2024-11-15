import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../generated/locales.g.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Dimension.s36,
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.s12,
        vertical: Dimension.s4,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.color818181,
          width: Dimension.s0pt25,
        ),
        borderRadius: BorderRadius.circular(Dimension.s16),
      ),
      child: TextField(
        style: PrimaryFont.instance.medium(
          size: Dimension.s16,
        ),
        cursorColor: AppColors.primary,
        keyboardType: TextInputType.name,
        showCursor: true,
        decoration: _searchTextDecoration(context),
      ),
    );
  }

  InputDecoration _searchTextDecoration(BuildContext context) {
    return InputDecoration(
      border: InputBorder.none,
      enabled: true,
      focusColor: AppColors.primary,
      hintText: LocaleKeys.searchHint,
      hintStyle: PrimaryFont.instance.regular(
        size: Dimension.s16,
        color: AppColors.color818181,
      ),
      suffixIcon: SvgPicture.asset(Assets.images.svg.searchIcon),
      suffixIconConstraints: const BoxConstraints(maxHeight: 20, maxWidth: 20)
    );
  }
}
