import 'package:nana/features/home/data/models/product_model.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.productsLoading() = _ProductsLoading;

  const factory HomeState.productsLoadingMore() = _ProductsLoadingMore;

  const factory HomeState.productsError(AppExceptions error) = _ProductsError;

  const factory HomeState.productsLoaded(List<ProductModel>? products) =
      _ProductsLoaded;

  const factory HomeState.productsLoadedMore(List<ProductModel>? products, bool canLoadMore) =
      _ProductsLoadedMore;
}
