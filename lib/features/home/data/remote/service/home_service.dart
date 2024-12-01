import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_service.g.dart';

@RestApi()
@injectable
abstract class HomeService {
  @factoryMethod
  factory HomeService(Dio dio) = _HomeService;

  /// Retrieves a list of products from the API with optional pagination.
  ///
  /// - [limit] (`int?`): Maximum number of products to retrieve (optional).
  /// - [offset] (`int?`): Starting point for retrieval (optional).
  ///
  /// Returns:
  /// - `Future<List<ProductModel>>`: A list of `ProductModel` fetched from the API.

  @GET(AppEndpoint.products)
  Future<List<ProductModel>> products(
    @Query('limit') int? limit,
    @Query('offset') int? offset,
  );
}
