import 'package:dartz/dartz.dart';
import 'package:nana/core/value_objects/value_object_failures/value_object_failure.dart';


abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity - same as writing (right) => right
    return value.fold((f) => throw f, id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit => value.fold(
        (l) => left(l),
        (r) => right(unit),
      );

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
