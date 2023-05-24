import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_error.freezed.dart';

@freezed
abstract class ApiError with _$ApiError {
  const factory ApiError.requestCancelled() = RequestCancelled;

  const factory ApiError.unauthorisedRequest() = UnauthorisedRequest;

  const factory ApiError.badRequest() = BadRequest;

  const factory ApiError.notFound(String reason) = NotFound;

  const factory ApiError.methodNotAllowed() = MethodNotAllowed;

  const factory ApiError.notAcceptable() = NotAcceptable;

  const factory ApiError.requestTimeout() = RequestTimeout;

  const factory ApiError.sendTimeout() = SendTimeout;

  const factory ApiError.conflict() = Conflict;

  const factory ApiError.internalServerError() = InternalServerError;

  const factory ApiError.notImplemented() = NotImplemented;

  const factory ApiError.serviceUnavailable() = ServiceUnavailable;

  const factory ApiError.noInternetConnection() = NoInternetConnection;

  const factory ApiError.formatException() = FormatException;

  const factory ApiError.unableToProcess() = UnableToProcess;

  const factory ApiError.defaultError(String error) = DefaultError;

  const factory ApiError.unexpectedError() = UnexpectedError;

  factory ApiError.fromDioException(Object error) {
    if (error is Exception) {
      try {
        ApiError apiError;
        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              apiError = const ApiError.requestCancelled();
              break;
            case DioErrorType.connectionTimeout:
              apiError = const ApiError.requestTimeout();
              break;
            case DioErrorType.unknown:
              apiError = const ApiError.noInternetConnection();
              break;
            case DioErrorType.receiveTimeout:
              apiError = const ApiError.sendTimeout();
              break;
            case DioErrorType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  apiError = const ApiError.unauthorisedRequest();
                  break;
                case 401:
                  apiError = const ApiError.unauthorisedRequest();
                  break;
                case 403:
                  apiError = const ApiError.unauthorisedRequest();
                  break;
                case 404:
                  apiError = const ApiError.notFound('Not found');
                  break;
                case 409:
                  apiError = const ApiError.conflict();
                  break;
                case 408:
                  apiError = const ApiError.requestTimeout();
                  break;
                case 500:
                  apiError = const ApiError.internalServerError();
                  break;
                case 503:
                  apiError = const ApiError.serviceUnavailable();
                  break;
                default:
                  final responseCode = error.response?.statusCode;
                  apiError = ApiError.defaultError(
                    'Received invalid status code: $responseCode',
                  );
              }
              break;
            case DioErrorType.sendTimeout:
              apiError = const ApiError.sendTimeout();
              break;
            case DioErrorType.badCertificate:
              apiError = const ApiError.conflict();
              break;
            case DioErrorType.connectionError:
              apiError = const ApiError.sendTimeout();
              break;
          }
        } else if (error is SocketException) {
          apiError = const ApiError.noInternetConnection();
        } else {
          apiError = const ApiError.unexpectedError();
        }
        return apiError;
      } on FormatException catch (_) {
        return const ApiError.formatException();
      } catch (_) {
        return const ApiError.unexpectedError();
      }
    } else {
      if (error.toString().contains('is not a subtype of')) {
        return const ApiError.unableToProcess();
      } else {
        return const ApiError.unexpectedError();
      }
    }
  }
}
