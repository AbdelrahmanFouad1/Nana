import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';

class AppExceptions with EquatableMixin implements Exception {
  final Exceptions? exceptions;

  AppExceptions({
    this.exceptions,
  }) {
    log(
      exceptions?.message ?? 'general_error_message'.tr(),
      error: exceptions?.exception,
      stackTrace: exceptions?.stackTrace,
    );
  }

  factory AppExceptions.remote({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory AppExceptions.local({Exceptions? exceptions}) =>
      AppExceptions(exceptions: exceptions);

  factory AppExceptions.storage({Exceptions? exceptions}) =>
      AppExceptions(exceptions: exceptions);

  factory AppExceptions.notFound({Exceptions? exceptions}) => AppExceptions(
          exceptions: Exceptions(
        statusCode: StatusCode.notFound.value,
        message: exceptions?.message,
        stackTrace: exceptions?.stackTrace,
        exception: exceptions?.exception,
      ));

  factory AppExceptions.internalServer({Exceptions? exceptions}) =>
      DataException(
          exceptions: Exceptions(
        statusCode: StatusCode.internalServer.value,
        message: exceptions?.message,
        stackTrace: exceptions?.stackTrace,
        exception: exceptions?.exception,
      ));

  factory AppExceptions.business({Exceptions? exceptions}) => AppExceptions(
          exceptions: Exceptions(
        statusCode: StatusCode.business.value,
        message: exceptions?.message,
        stackTrace: exceptions?.stackTrace,
        exception: exceptions?.exception,
      ));

  @override
  List<Object?> get props => [exceptions];
}

enum StatusCode {
  notFound(404),
  business(402),
  internalServer(500);

  const StatusCode(this.value);

  final int value;
}

class NetworkException extends AppExceptions {
  NetworkException({super.exceptions});

  factory NetworkException.unauthorisedRequest({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.badRequest({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.forbiddenRequest({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.unexpectedError({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.requestCancelled({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.requestTimeout({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.sendTimeout({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.notFound({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.conflict({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.internalServerError({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.serviceUnavailable({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.defaultError({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.noInternetConnection({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.businessError({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.mappingDataError({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);

  factory NetworkException.permissionExceptions({Exceptions? exceptions}) =>
      NetworkException(exceptions: exceptions);
}

class DataException extends AppExceptions {
  DataException({super.exceptions});

  factory DataException.dataNotFound({Exceptions? exceptions}) =>
      DataException(exceptions: exceptions);
}

class TimeOutException extends AppExceptions {
  TimeOutException({super.exceptions});
}

class Exceptions with EquatableMixin {
  final String? message;
  final int? statusCode;
  final StackTrace? stackTrace;

  final Object? exception;

  Exceptions({
    this.statusCode,
    this.message,
    this.stackTrace,
    this.exception,
  });

  @override
  List<Object?> get props => [
        'Message: $message',
        'StatusCode: $statusCode',
        'StackTrace: $stackTrace',
        'Exception: $exception'
      ];
}
