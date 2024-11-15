/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// Directory path: assets/images/png
  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();

  /// Directory path: assets/images/svg
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsLocalesGen {
  const $AssetsLocalesGen();

  /// File path: assets/locales/en_US.json
  String get enUS => 'assets/locales/en_US.json';

  /// List of all assets
  List<String> get values => [enUS];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/red_globe_loader.json
  String get redGlobeLoaderJson => 'assets/lottie/red_globe_loader.json';

  /// File path: assets/lottie/red_globe_loader.lottie
  String get redGlobeLoaderLottie => 'assets/lottie/red_globe_loader.lottie';

  /// List of all assets
  List<String> get values => [redGlobeLoaderJson, redGlobeLoaderLottie];
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/app_bar_afternoon.png
  AssetGenImage get appBarAfternoon =>
      const AssetGenImage('assets/images/png/app_bar_afternoon.png');

  /// File path: assets/images/png/app_bar_evening.png
  AssetGenImage get appBarEvening =>
      const AssetGenImage('assets/images/png/app_bar_evening.png');

  /// File path: assets/images/png/app_bar_morning.jpeg
  AssetGenImage get appBarMorning =>
      const AssetGenImage('assets/images/png/app_bar_morning.jpeg');

  /// File path: assets/images/png/app_bar_night.png
  AssetGenImage get appBarNight =>
      const AssetGenImage('assets/images/png/app_bar_night.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [appBarAfternoon, appBarEvening, appBarMorning, appBarNight];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/bookmark_heart.svg
  String get bookmarkHeart => 'assets/images/svg/bookmark_heart.svg';

  /// File path: assets/images/svg/delete_black.svg
  String get deleteBlack => 'assets/images/svg/delete_black.svg';

  /// File path: assets/images/svg/favourite_active.svg
  String get favouriteActive => 'assets/images/svg/favourite_active.svg';

  /// File path: assets/images/svg/favourite_default.svg
  String get favouriteDefault => 'assets/images/svg/favourite_default.svg';

  /// File path: assets/images/svg/filter_black.svg
  String get filterBlack => 'assets/images/svg/filter_black.svg';

  /// File path: assets/images/svg/filter_white.svg
  String get filterWhite => 'assets/images/svg/filter_white.svg';

  /// File path: assets/images/svg/home_active.svg
  String get homeActive => 'assets/images/svg/home_active.svg';

  /// File path: assets/images/svg/home_default.svg
  String get homeDefault => 'assets/images/svg/home_default.svg';

  /// File path: assets/images/svg/location_icon.svg
  String get locationIcon => 'assets/images/svg/location_icon.svg';

  /// File path: assets/images/svg/notification_icon.svg
  String get notificationIcon => 'assets/images/svg/notification_icon.svg';

  /// File path: assets/images/svg/profile_active.svg
  String get profileActive => 'assets/images/svg/profile_active.svg';

  /// File path: assets/images/svg/profile_default.svg
  String get profileDefault => 'assets/images/svg/profile_default.svg';

  /// File path: assets/images/svg/search_icon.svg
  String get searchIcon => 'assets/images/svg/search_icon.svg';

  /// List of all assets
  List<String> get values => [
        bookmarkHeart,
        deleteBlack,
        favouriteActive,
        favouriteDefault,
        filterBlack,
        filterWhite,
        homeActive,
        homeDefault,
        locationIcon,
        notificationIcon,
        profileActive,
        profileDefault,
        searchIcon
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLocalesGen locales = $AssetsLocalesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
