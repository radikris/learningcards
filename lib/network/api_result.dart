import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learningcards/network/api_error.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;

  const factory ApiResult.error(ApiError error) = Error<T>;
}
