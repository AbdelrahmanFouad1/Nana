import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';

class AppChipItem extends StatelessWidget {
  const AppChipItem({
    super.key,
    required this.item,
    this.isActive = true,
    this.isSelected = false,
    this.onTap,
  });

  final String item;
  final bool isActive;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 8.w),
        child: Chip(
          backgroundColor: isActive
              ? isSelected
                  ? context.appColor.primary
                  : null
              : null,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(
              color: isActive
                  ? context.appColor.primary
                  : context.appColor.grey600,
            ),
          ),
          label: Text(
            item,
            style: context.textTheme.bodyMedium?.copyWith(
              color: isActive
                  ? isSelected
                      ? context.appColor.white
                      : context.appColor.primary
                  : context.appColor.grey600,
            ),
          ),
        ),
      ),
    );
  }
}
