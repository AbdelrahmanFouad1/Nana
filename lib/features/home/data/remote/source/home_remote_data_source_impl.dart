import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/data/models/product_model.dart';
import 'package:nana/features/home/data/remote/service/home_service.dart';
import 'package:nana/features/home/data/remote/source/home_remote_data_source.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final HomeService _service;

  const HomeRemoteDataSourceImpl(this._service);

  /// Fetches a list of products with optional pagination.
  ///
  /// - [limit] (`int?`): Maximum number of products to fetch (optional).
  /// - [offset] (`int?`): Starting point for fetching products (optional).
  ///
  /// Returns:
  /// - `Future<List<ProductModel>>`: A list of `ProductModel` fetched from the service.
  ///
  /// Throws:
  /// - `NanaExceptions.getDioException` if a `DioException` occurs.
  /// - `NanaExceptions.getMappingDataException` for other unexpected errors.

  @override
  Future<List<ProductModel>> products(
    int? limit,
    int? offset,
  ) async {
    try {
      return await _service.products(limit, offset);
    } on DioException catch (error) {
      throw NanaExceptions.getDioException(error);
    } catch (e) {
      throw NanaExceptions.getMappingDataException(e);
    }
  }
}
