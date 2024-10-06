import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/constants/spacing.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_category_bloc.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/bloc/news_home_bloc.dart';
import 'package:breeze_and_bulletin/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCategoryWidget extends StatelessWidget {
  final Function(int, String?) onSelection;
  final String selectedCategory;

  const NewsCategoryWidget({
    required this.onSelection,
    required this.selectedCategory,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCategoryBloc, NewsHomeState>(
      builder: (context, state) {
        if (state is ShowNewsCategories) {
          return ListView.builder(
            itemCount: state.categories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      onSelection(
                        index,
                        state.categories[index],
                      );
                    },
                    child: _buildCategoryContainer(index, state),
                  ),
                  WidthBox.size8,
                ],
              );
            },
          );
        }
        return Container();
      },
    );
  }

  Container _buildCategoryContainer(int index, ShowNewsCategories state) {
    final selectedIndex = state.categories.keys.firstWhere(
      (k) => state.categories[k] == selectedCategory,
      orElse: () => 0,
    );

    return Container(
      padding: const EdgeInsets.all(Dimension.s12),
      decoration: BoxDecoration(
        color: selectedIndex == state.categories.keys.toList()[index]
            ? AppColors.primary
            : AppColors.colorF0F1FA,
        borderRadius: BorderRadius.circular(Dimension.s20),
      ),
      child: Text(
        state.categories.values.toList()[index] ??
            Strings.current.trendingTitle,
        style: selectedIndex == state.categories.keys.toList()[index]
            ? PrimaryFont.instance.bold(color: Colors.white)
            : PrimaryFont.instance.bold(),
        textAlign: TextAlign.center,
      ),
    );
  }
}
