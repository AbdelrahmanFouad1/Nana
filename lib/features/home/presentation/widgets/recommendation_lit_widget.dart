import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/features/home/data/fixture/fixture_products.dart';
import 'package:nana/features/home/presentation/cubit/home_cubit.dart';
import 'package:nana/features/home/presentation/cubit/home_state.dart';
import 'package:nana/features/home/presentation/widgets/product_item_widget.dart';

class RecommendationLitWidget extends StatelessWidget with ToastMixin {
  const RecommendationLitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      height:
          MediaQuery.sizeOf(context).height * (context.isTablet ? 0.44 : 0.36),
      decoration: BoxDecoration(
        color: context.appColor.white,
        borderRadius: BorderRadius.circular(16.w),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Text(
              context.recommendation,
              style: context.textTheme.displayLarge,
            ),
          ),
          16.verticalSpace,
          Expanded(
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (context, state) {
                state.mapOrNull(
                  productsError: (e) => showCustomToast(
                    context: context,
                    message: e.error.exceptions?.message ??
                        context.generalErrorMessage,
                    state: ToastState.error,
                  ),
                );
              },
              builder: (context, state) {
                return ListView.separated(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Skeletonizer(
                    enabled: state.maybeWhen(
                      productsLoading: () => true,
                      orElse: () => false,
                    ),
                    child: ProductItemWidget(
                      model: state.maybeWhen(
                        productsLoading: () => productMockList[index],
                        orElse: () => HomeCubit.get(context)
                            .productsRecommendation[index],
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => 10.horizontalSpace,
                  itemCount: state.maybeWhen(
                    productsLoading: () => productMockList.length,
                    orElse: () =>
                        HomeCubit.get(context).productsRecommendation.length,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}