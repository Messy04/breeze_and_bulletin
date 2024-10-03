import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/constants/spacing.dart';
import 'package:breeze_and_bulletin/feature/home/presentation/widget/bottom_nav_bar.dart';
import 'package:breeze_and_bulletin/feature/home/presentation/widget/notification_widget.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/widget/news_category_widget.dart';
import 'package:breeze_and_bulletin/feature/news/presentation/widget/news_row_widget.dart';
import 'package:breeze_and_bulletin/feature/home/presentation/widget/search_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: Dimension.s32,
          left: Dimension.s24,
          right: Dimension.s24,
        ),
        child: Column(
          children: [
            HeightBox.size48,
            Row(
              children: [
                const Expanded(child: SearchWidget()),
                WidthBox.size16,
                const NotificationWidget(),
              ],
            ),
            HeightBox.size32,
            const NewsRowWidget(
              title: 'Trending News',
            ),
            HeightBox.size16,
            const SizedBox(
              height: Dimension.s50,
              child: NewsCategoryWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(),

    );
  }
}
