import 'package:dartz/dartz.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/data/models/product_model.dart';
import 'package:nana/features/home/data/remote/source/home_remote_data_source.dart';
import 'package:nana/features/home/domain/repository/home_repository.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepositoryImpl(this.remoteDataSource);

  /// Fetches a list of products with optional pagination.
  ///
  /// - [limit] (`int?`): Maximum number of products to fetch (optional).
  /// - [offset] (`int?`): Starting point for fetching products (optional).
  ///
  /// Returns:
  /// - `Either<AppExceptions, List<ProductModel>>`: A result containing either
  ///   a list of `ProductModel` on success or an `AppExceptions` on failure.
  ///
  /// Exceptions:
  /// - Handles `AppExceptions` and unknown exceptions.

  @override
  Future<Either<AppExceptions, List<ProductModel>>> products(
    int? limit,
    int? offset,
  ) async {
    try {
      final remoteResult = await remoteDataSource.products(limit, offset);
      return right(remoteResult);
    } on AppExceptions catch (exceptions) {
      return left(exceptions);
    } catch (_) {
      return left(NanaExceptions.getUnknownException());
    }
  }
}
