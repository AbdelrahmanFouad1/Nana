import 'package:flutter/material.dart';
import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:nana/core/util/widgets/app_cupertino_indicator.dart';

class LoadMore extends StatelessWidget {
  const LoadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        16.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppCupertinoActivityIndicator(
              activeColor: context.appColor.primary,
            ),
            8.horizontalSpace,
            Text(
              context.loadMore,
              style: context.textTheme.bodyMedium?.copyWith(
                  color: context.appColor.primary, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
