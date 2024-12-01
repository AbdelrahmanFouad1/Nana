import 'package:nana/features/home/data/models/product_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<ProductModel>> products(
    int? limit,
    int? offset,
  );
}
