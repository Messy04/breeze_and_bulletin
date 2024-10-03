import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;

  const DataState({this.data, this.error});
}

class DataSuccess<T> extends DataState {
  DataSuccess(T data) : super(data: data);
}

class DataFailure extends DataState {
  DataFailure(DioException error) : super(error: error);
}
