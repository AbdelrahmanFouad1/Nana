import 'dart:io';

import 'package:nana/core/util/resources/common_dependencies.dart';

class NanaExceptions extends AppExceptions {
  NanaExceptions({
    super.exceptions,
  });

  static AppExceptions getUnknownException() {
    return NetworkException.unexpectedError();
  }
  static AppExceptions permissionException({Exceptions? exceptions}) {
    return NetworkException.permissionExceptions();
  }

  static AppExceptions getMappingDataException(Object error,
      {StackTrace? stackTrace}) {
    return NetworkException.mappingDataError(
      exceptions: Exceptions(
        statusCode: error.hashCode,
        message: error.toString(),
        stackTrace: stackTrace,
        exception: error,
      ),
    );
  }

  static AppExceptions _onOtherDioError({Exceptions? exceptions}) {
    try {
      return AppExceptions(exceptions: exceptions);
    } catch (_) {
      throw getUnknownException();
    }
  }

  static AppExceptions getDioException(error) {
    AppExceptions networkExceptions;
    if (error is DioException) {
      switch (error.type) {
        case DioExceptionType.cancel:
          networkExceptions = NetworkException.requestCancelled(
            exceptions: Exceptions(
              statusCode: error.response?.statusCode,
              message: error.response?.data['message'],
              stackTrace: error.stackTrace,
              exception: error,
            ),
          );
          break;
        case DioExceptionType.connectionTimeout:
          networkExceptions = NetworkException.requestTimeout(
            exceptions: Exceptions(
              statusCode: error.response?.statusCode,
              message: error.response?.data['message'],
              stackTrace: error.stackTrace,
              exception: error,
            ),
          );
          break;
        case DioExceptionType.receiveTimeout:
          networkExceptions = NetworkException.sendTimeout(
            exceptions: Exceptions(
              statusCode: error.response?.statusCode,
              message: error.response?.data['message'],
              stackTrace: error.stackTrace,
              exception: error,
            ),
          );
          break;
        case DioExceptionType.badResponse:
          switch (error.response?.statusCode) {
            case 400:
              networkExceptions = NetworkException.badRequest(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            case 401:
              networkExceptions = NetworkException.unauthorisedRequest(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            case 403:
              networkExceptions = NetworkException.forbiddenRequest(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            case 404:
              networkExceptions = NetworkException.notFound(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            case 409:
              networkExceptions = NetworkException.conflict(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            case 408:
              networkExceptions = NetworkException.requestTimeout(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            case 422:
              networkExceptions = NetworkException.businessError(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            case 500:
              networkExceptions = NetworkException.internalServerError(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            case 503:
              networkExceptions = NetworkException.serviceUnavailable(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
              break;
            default:
              networkExceptions = NetworkException.defaultError(
                exceptions: Exceptions(
                  statusCode: error.response?.statusCode,
                  message: error.response?.data['message'],
                  stackTrace: error.stackTrace,
                  exception: error,
                ),
              );
          }
          break;
        case DioExceptionType.unknown:
          networkExceptions = _onOtherDioError(
            exceptions: Exceptions(
              statusCode: error.response?.statusCode,
              message: error.response?.data['message'],
              stackTrace: error.stackTrace,
              exception: error,
            ),
          );
          break;
        default:
          networkExceptions = NetworkException.defaultError(
            exceptions: Exceptions(
              statusCode: error.response?.statusCode,
              message: error.response?.data['message'],
              stackTrace: error.stackTrace,
              exception: error,
            ),
          );
          break;
      }
    } else if (error is SocketException) {
      networkExceptions = NetworkException.noInternetConnection(
        exceptions: Exceptions(
          message: error.message,
          exception: error,
        ),
      );
    } else {
      networkExceptions = NetworkException.unexpectedError(
        exceptions: Exceptions(
          statusCode: error.response?.statusCode,
          message: error.response?.data['message'],
          stackTrace: error.stackTrace,
          exception: error,
        ),
      );
    }
    return networkExceptions;
  }
}
