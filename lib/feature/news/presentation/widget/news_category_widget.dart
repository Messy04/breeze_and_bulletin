import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/constants/spacing.dart';
import 'package:flutter/material.dart';

class NewsCategoryWidget extends StatefulWidget {
  const NewsCategoryWidget({super.key});

  @override
  State<NewsCategoryWidget> createState() => _NewsCategoryWidgetState();
}

class _NewsCategoryWidgetState extends State<NewsCategoryWidget> {
  int _selectedIndex = 0;

  final Map<int, String> _categories = {
    0: 'Health',
    1: 'Sports',
    2: 'Technology',
    3: 'Finance',
    4: 'Science',
    5: 'Arts',
  };

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Row(
          children: [
            GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = index);
              },
              child: _buildContainer(index),
            ),
            WidthBox.size8,
          ],
        );
      },
      // shrinkWrap: true,
    );
  }

  Container _buildContainer(int index) {
    return Container(
      padding: const EdgeInsets.all(Dimension.s12),
      decoration: BoxDecoration(
        color: _selectedIndex == _categories.keys.toList()[index]
            ? AppColors.primary
            : AppColors.colorF0F1FA,
        borderRadius: BorderRadius.circular(Dimension.s20),
      ),
      child: Text(
        _categories.values.toList()[index],
        style: _selectedIndex == _categories.keys.toList()[index]
            ? PrimaryFont.instance.bold()
            : PrimaryFont.instance.bold(color: Colors.black87),
        textAlign: TextAlign.center,
      ),
    );
  }
}
