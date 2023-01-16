// Project imports:
import '../error/api_error.dart';

abstract class DataState<T> {
  const DataState({
    this.data,
    this.error,
  });

  final T? data;
  final ApiError? error;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(ApiError error) : super(error: error);
}
