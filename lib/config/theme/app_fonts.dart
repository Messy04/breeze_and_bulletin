import 'package:breeze_and_bulletin/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

// enum FontType {
//   bold,
//   medium,
//   regular,
//   semiBold,
// }

abstract class Font {
  final ThemeType themeType;
  final FontStyle style;
  final Color color;

  const Font({
    this.color = Colors.black87,
    this.style = FontStyle.normal,
    this.themeType = ThemeType.light,
  });

  String get primaryFontFamily => 'Nunito';

  String get secondaryFontFamily => 'NewYorkSmall';
}

/// Primary Font Encapsulation
class PrimaryFont extends Font {
  static final instance = PrimaryFont._internal();

  factory PrimaryFont() {
    return instance;
  }

  PrimaryFont._internal();

  TextStyle regular({
    double size = 14,
    Color? color,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size,
      fontStyle: style ?? super.style,
      color: color ?? super.color,
      fontWeight: FontWeight.normal,
      fontFamily: primaryFontFamily,
    );
  }

  TextStyle medium({
    double size = 14,
    Color? color,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size,
      fontStyle: style ?? super.style,
      color: color ?? super.color,
      fontWeight: FontWeight.w400,
      fontFamily: primaryFontFamily,
    );
  }

  TextStyle semiBold({
    double size = 14,
    Color? color,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size,
      fontStyle: style ?? super.style,
      color: color ?? super.color,
      fontWeight: FontWeight.w600,
      fontFamily: primaryFontFamily,
    );
  }

  TextStyle bold({
    double size = 14,
    Color? color,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size,
      fontStyle: style ?? super.style,
      color: color ?? super.color,
      fontWeight: FontWeight.w800,
      fontFamily: primaryFontFamily,
    );
  }
}

/// Secondary Font Encapsulation
class SecondaryFont extends Font {
  static final instance = SecondaryFont._internal();

  factory SecondaryFont() {
    return instance;
  }

  SecondaryFont._internal();

  TextStyle regular({
    double size = 14,
    Color? color,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size,
      fontStyle: style ?? super.style,
      color: color ?? super.color,
      fontWeight: FontWeight.normal,
      fontFamily: secondaryFontFamily,
    );
  }

  TextStyle medium({
    double size = 14,
    Color? color,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size,
      fontStyle: style ?? super.style,
      color: color ?? super.color,
      fontWeight: FontWeight.w400,
      fontFamily: secondaryFontFamily,
    );
  }

  TextStyle semiBold({
    double size = 14,
    Color? color,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size,
      fontStyle: style ?? super.style,
      color: color ?? super.color,
      fontWeight: FontWeight.w600,
      fontFamily: secondaryFontFamily,
    );
  }

  TextStyle bold({
    double size = 14,
    Color? color,
    FontStyle? style,
  }) {
    return TextStyle(
      fontSize: size,
      fontStyle: style ?? super.style,
      color: color ?? super.color,
      fontWeight: FontWeight.w800,
      fontFamily: secondaryFontFamily,
    );
  }
}
