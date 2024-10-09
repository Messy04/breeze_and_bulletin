import 'package:breeze_and_bulletin/config/theme/app_colors.dart';
import 'package:breeze_and_bulletin/config/theme/app_fonts.dart';
import 'package:breeze_and_bulletin/core/constants/dimension.dart';
import 'package:breeze_and_bulletin/core/resources/app_images.dart';
import 'package:breeze_and_bulletin/core/resources/widgets/shimmer_loading.dart';
import 'package:breeze_and_bulletin/core/utils/app_extensions.dart';
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
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _locationWidget(state),
                    16.width,
                    _weatherStatusImageWidget(state),
                  ],
                ),
                4.height,
                Center(
                  child: Text(
                    '${state.currentWeather?.tempC ?? 0}°C / ${state.currentWeather?.tempF ?? 0}°F',
                    style: PrimaryFont.instance.semiBold(size: Dimension.s24),
                  ),
                ),
                4.height,
                Text(
                  'Humidity: ${state.currentWeather?.humidity}%',
                  style: PrimaryFont.instance.bold(size: Dimension.s16),
                ),
                4.height,
                Text(
                  'Feels Like: ${state.currentWeather?.feelslikeC ?? 0}°C / ${state.currentWeather?.feelslikeF ?? 0}°F',
                  style: PrimaryFont.instance.bold(size: Dimension.s16),
                ),
              ],
            ),
          );
        } else if (state is DataErrorState) {
          return const SizedBox.shrink();
        }
        return ShimmerLoading(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimension.s8),
            ),
            width: 100,
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
          width: Dimension.s14,
          child: SvgPicture.asset(SvgImage.locationIcon),
        ),
        Text(
          state.location?.name ?? '',
          style: PrimaryFont.instance.bold(size: Dimension.s18),
        ),
      ],
    );
  }

  Widget _weatherStatusImageWidget(ShowWeatherDetails state) {
    return Row(
      children: [
        SizedBox(
          child: CachedNetworkImage(
            height: Dimension.s48,
            width: Dimension.s48,
            imageUrl: 'https:${state.currentWeather?.condition?.icon}',
          ),
        ),
        Text(
          state.currentWeather?.condition?.text ?? '',
          style: PrimaryFont.instance.bold(size: Dimension.s16),
        ),
      ],
    );
  }
}
