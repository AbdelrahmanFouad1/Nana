import 'package:dartz/dartz.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/data/models/product_model.dart';

abstract class HomeRepository {
  Future<Either<AppExceptions, List<ProductModel>>> products(
    int? limit,
    int? offset,
  );
}
