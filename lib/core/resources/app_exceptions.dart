import 'package:dio/dio.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../generated/locales.g.dart';

class AppException {
  String getExceptionMessage(DioExceptionType exceptionType) {
    switch (exceptionType) {
      case DioExceptionType.connectionError:
        return LocaleKeys.connectionError.tr;
      case DioExceptionType.connectionTimeout:
        return LocaleKeys.connectionTimeoutError.tr;
      default:
        return LocaleKeys.somethingWentWrong.tr;
    }
  }
}
