import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/resources/widgets/shimmer_loading.dart';
import 'package:flutter/material.dart';

class AQIHomeWidget extends StatelessWidget {
  const AQIHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShimmerLoading(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimension.s8),
        ),
        height: 100,
      ),
    );
  }
}
