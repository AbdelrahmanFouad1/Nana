import 'package:dartz/dartz.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/data/models/product_model.dart';
import 'package:nana/features/home/domain/repository/home_repository.dart';

@injectable
class ProductsUseCase
    implements BaseUseCase<List<ProductModel>, PaginationData> {
  final HomeRepository repository;

  const ProductsUseCase(this.repository);

  @override
  Future<Either<AppExceptions, List<ProductModel>>> call(
      PaginationData data) async {
    return await repository.products(data.limit, data.offset);
  }
}

class PaginationData {
  final int? limit;
  final int? offset;

  PaginationData({this.limit, this.offset});
}