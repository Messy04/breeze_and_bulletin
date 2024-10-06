import 'package:breeze_and_bulletin/generated/l10n.dart';
import 'package:dio/dio.dart';

class AppException {
  String getExceptionMessage(DioExceptionType exceptionType) {
    switch(exceptionType) {
      case DioExceptionType.connectionError:
        return Strings.current.connectionError;
      case DioExceptionType.connectionTimeout:
        return Strings.current.connectionTimeoutError;
      default:
        return Strings.current.somethingWentWrong;
    }
  }
}