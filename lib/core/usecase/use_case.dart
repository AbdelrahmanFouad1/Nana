import 'package:dartz/dartz.dart';
import 'package:nana/core/error/exceptions.dart';

/*
* a base useCase class that has only one method for executing
*
*   Type -> Indicate to the Response data type
*    Params -> Indicate  to which Parameters you want to pass to your method
*
* */



abstract class BaseUseCase <Type, Params> {
  Future<Either<AppExceptions, Type>> call(Params params);
}

abstract class BaseUseCaseWithoutFailure <Type, Params> {
  Future<Type> call(Params params);
}

abstract class BaseUseCaseStream<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParam{}
