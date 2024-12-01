import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/data/models/product_model.dart';
import 'package:nana/features/home/domain/usecases/products_usecase.dart';
import 'package:nana/features/home/presentation/cubit/home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final ProductsUseCase _productsUseCase;

  HomeCubit(
    this._productsUseCase,
  ) : super(const HomeState.initial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<ProductModel> _productsMostUsed = [];

  List<ProductModel> get productsMostUsed => _productsMostUsed;

  List<ProductModel> _productsRecommendation = [];

  List<ProductModel> get productsRecommendation => _productsRecommendation;

  int _offset = 0;

  /// Handles the fetching of products with optional pagination.
  ///
  /// This function fetches a list of products. It supports pagination to fetch
  /// additional products incrementally or can fetch the initial product list.
  ///
  /// - If `pagination` is true, it fetches the next set of products starting
  ///   from the current offset.
  /// - If `pagination` is false, it fetches the products from the beginning.
  ///
  /// ### Parameters:
  /// - [pagination] (`bool`): Indicates whether the function should fetch the
  ///   next set of products (default is `false`).
  ///
  /// ### Notes:
  /// - Uses `_productsUseCase` to perform the fetching operation.
  /// - The `response` is expected to be a `Result` with `fold` for error and
  ///   success handling.

  products({
    bool pagination = false,
  }) async {
    if (pagination) {
      _offset += 12;
      emit(const HomeState.productsLoadingMore());
    } else {
      emit(const HomeState.productsLoading());
    }
    final response = await _productsUseCase.call(PaginationData(
      limit: 12,
      offset: _offset,
    ));

    response.fold((left) {
      return emit(HomeState.productsError(left));
    }, (right) {
      if (pagination) {
        _productsMostUsed = [..._productsMostUsed, ...right];
        return emit(HomeState.productsLoadedMore(right, right.isNotEmpty));
      } else {
        _productsRecommendation = _productsMostUsed = right;
        return emit(HomeState.productsLoaded(right));
      }
    });
  }
}
