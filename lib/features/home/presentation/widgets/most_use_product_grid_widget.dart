import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/core/util/widgets/scroll_notification_listener.dart';
import 'package:nana/features/home/data/fixture/fixture_products.dart';
import 'package:nana/features/home/presentation/cubit/home_cubit.dart';
import 'package:nana/features/home/presentation/cubit/home_state.dart';
import 'package:nana/features/home/presentation/widgets/product_item_widget.dart';

class MostUseProductGridWidget extends StatelessWidget {
  const MostUseProductGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final products = HomeCubit.get(context).productsMostUsed;

          final isLoading = state.maybeMap(
            productsLoading: (_) => true,
            productsLoadingMore: (_) => true,
            orElse: () => false,
          );

          onReachLimit() => !isLoading
              ? HomeCubit.get(context).products(pagination: true)
              : null;

          final grid = GridView.builder(
            padding: const EdgeInsets.all(0),
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.0.w,
              mainAxisSpacing: 8.0.h,
              childAspectRatio: context.isTablet ? 0.64 : 0.54,
            ),
            itemBuilder: (context, index) => Skeletonizer(
              enabled: state.maybeWhen(
                productsLoading: () => true,
                orElse: () => false,
              ),
              child: ProductItemWidget(
                model: state.maybeWhen(
                  productsLoading: () => productMockList[index],
                  orElse: () => products[index],
                ),
              ),
            ),
            itemCount: state.maybeWhen(
              productsLoading: () => productMockList.length,
              orElse: () => products.length,
            ),
          );

          return state.maybeMap(
            productsLoading: (_) => grid,
            orElse: () => ScrollNotificationListener(
              onReachLimit: onReachLimit,
              itemLength: products.length,
              canLoadMore: state.mapOrNull(
                productsLoaded: (product) => true,
                productsLoadedMore: (product) => product.canLoadMore,
              ),
              child: grid,
            ),
          );
        },
      ),
    );
  }
}
