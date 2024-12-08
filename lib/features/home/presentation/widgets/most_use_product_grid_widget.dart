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
        buildWhen: (previous, current) => current.maybeWhen(
          orElse: () => false,
          productsLoaded: (_) => true,
          productsLoadedMore: (_, __) => true,
        ),
        builder: (context, state) {
          final data = state.maybeWhen(
            productsLoaded: (products) => products ?? [],
            productsLoadedMore: (products, _) => products ?? [],
            orElse: () => productMockList,
          );

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
                productsLoaded: (_) => false,
                productsLoadedMore: (_, __) => false,
                orElse: () => true,
              ),
              child: ProductItemWidget(
                model: data[index],
              ),
            ),
            itemCount: data.length,
          );

          return state.maybeMap(
            productsLoading: (_) => grid,
            orElse: () => ScrollNotificationListener(
              onReachLimit: () =>
                  HomeCubit.get(context).products(pagination: true),
              itemLength: data.length,
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
