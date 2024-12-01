import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/core/util/widgets/app_cupertino_indicator.dart';
import 'package:nana/features/home/data/models/product_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            Skeleton.shade(
              child: Container(
                width: 110.w,
                height: 110.h,
                decoration: BoxDecoration(
                  color: context.appColor.grey200,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: CachedNetworkImage(
                  imageUrl: model.images?.first ?? '',
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => AppCupertinoActivityIndicator(
                    radius: 55.r,
                    activeColor: context.appColor.primary,
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
            ),
            Skeleton.ignore(
              child: GestureDetector(
                onTap: (){},
                child: Container(
                  padding: EdgeInsets.all(4.w),
                  margin: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: context.appColor.black,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child:  Assets.icons.add.svg(
                      width: 24.w,
                      height: 24.h,
                    ),
                ),
              ),
            ),
          ],
        ),
        8.verticalSpace,
        Row(
          children: [
            Text(
              context.sar,
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.appColor.grey500,
              ),
            ),
            4.horizontalSpace,
            Text(
              model.price?.toString() ?? '0.00',
              style: context.textTheme.displayMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        2.verticalSpace,
        SizedBox(
          width: 110.w,
          child: Text(
            model.title ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: context.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
