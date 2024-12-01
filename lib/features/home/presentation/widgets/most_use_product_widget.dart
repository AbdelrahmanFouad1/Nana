import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/core/util/widgets/load_more.dart';
import 'package:nana/features/home/presentation/cubit/home_cubit.dart';
import 'package:nana/features/home/presentation/cubit/home_state.dart';
import 'package:nana/features/home/presentation/widgets/most_use_product_grid_widget.dart';

class MostUseProductWidget extends StatelessWidget {
  const MostUseProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.55,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: context.appColor.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.mostUseProducts,
            style: context.textTheme.displayLarge,
          ),
          16.verticalSpace,
          const MostUseProductGridWidget(),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return state.maybeMap(
                productsLoadingMore: (_) => const LoadMore(),
                orElse: () => SizedBox.shrink(),
              );
            },
          ),
        ],
      ),
    );
  }
}
