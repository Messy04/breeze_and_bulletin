import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/resources/widgets/shimmer_loading.dart';
import 'package:breeze_and_bulletin/feature/aqi/presentation/bloc/aqi_home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AQIHomeWidget extends StatelessWidget {
  const AQIHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AqiHomeBloc, AqiHomeState>(
      builder: (context, state) {
        if (state is ShowAirQualityState) {
          return _aqiDetailContainer(state);
        } else if (state is DataErrorState) {
          return const SizedBox.shrink();
        }
        return ShimmerLoading(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimension.s8),
            ),
          ),
        );
      },
    );
  }

  Container _aqiDetailContainer(ShowAirQualityState state) {
    return Container(
      height: 160,
      padding: const EdgeInsets.all(Dimension.s16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Dimension.s8),
        boxShadow: [
          BoxShadow(
            blurRadius: Dimension.s6,
            offset: const Offset(-1, 2),
            color: AppColors.color8C8C8C,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'AQI: ${state.airQuality?.pm10}',
            style: PrimaryFont.instance.bold(size: Dimension.s24),
          ),
          Text(
            'Satisfactory',
            style: PrimaryFont.instance.semiBold(size: Dimension.s18),
          ),
        ],
      ),
    );
  }
}
