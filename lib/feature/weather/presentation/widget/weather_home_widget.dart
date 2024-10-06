import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/constants/spacing.dart';
import 'package:breeze_and_bulletin/core/resources/app_images.dart';
import 'package:breeze_and_bulletin/core/resources/widgets/shimmer_loading.dart';
import 'package:breeze_and_bulletin/feature/weather/presentation/bloc/weather_home_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeatherHomeWidget extends StatelessWidget {
  const WeatherHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherHomeBloc, WeatherHomeState>(
      builder: (context, state) {
        if (state is ShowWeatherDetails) {
          return Container(
            padding: const EdgeInsets.all(Dimension.s16),
            decoration: BoxDecoration(
              color: AppColors.colorF0F1FA,
              borderRadius: BorderRadius.circular(Dimension.s8),
              boxShadow: [
                BoxShadow(
                  blurRadius: Dimension.s4,
                  offset: const Offset(-1, 2),
                  color: AppColors.color8C8C8C,
                )
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    _locationWidget(state),
                    WidthBox.size16,
                    _weatherStatusImageWidget(state),
                  ],
                ),
                HeightBox.size8,
                Center(
                  child: Text(
                    state.response?.currentWeather?.tempC.toString() ?? '',
                    style: PrimaryFont.instance.semiBold(size: Dimension.s22),
                  ),
                ),
                Text(
                  state.response?.currentWeather?.condition?.text?.name ?? '',
                  style: PrimaryFont.instance.bold(),
                ),
              ],
            ),
          );
        }
        return ShimmerLoading(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimension.s8),
            ),
            height: 100,
          ),
        );
      },
    );
  }

  Widget _locationWidget(ShowWeatherDetails state) {
    return Row(
      children: [
        SizedBox(
          height: Dimension.s20,
          width: Dimension.s12,
          child: SvgPicture.asset(SvgImage.locationIcon),
        ),
        Text(
          state.response?.location?.name ?? '',
          style: PrimaryFont.instance.bold(size: Dimension.s16),
        ),
      ],
    );
  }

  Widget _weatherStatusImageWidget(ShowWeatherDetails state) {
    return SizedBox(
      child: CachedNetworkImage(
        height: Dimension.s24,
        width: Dimension.s24,
        imageUrl: 'https://cdn.weatherapi.com/weather/64x64/night/116.png',
            // 'https:${state.response?.currentWeather?.condition?.icon?.name}' ??
            //     'https://cdn.weatherapi.com/weather/64x64/night/116.png',
      ),
    );
  }
}
