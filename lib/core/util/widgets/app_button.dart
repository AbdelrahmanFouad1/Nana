import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';
import '/core/util/widgets/app_cupertino_indicator.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final double? width;
  final double height;
  final Color? color;
  final Color? textColor;
  final Color? fullBodyColor;
  final AppButtonType _type;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final SizedBox? prefixIconHorizontalSpase;
  final TextStyle? textStyle;
  final double? radius;
  final MainAxisAlignment? alignment;

  final bool shadowHide;
  final AppButtonState state;

  const AppButton({
    super.key,
    this.onPressed,
    this.alignment,
    required this.text,
    this.color,
    this.textColor,
    this.width = double.infinity,
    this.height = 57.0,
    this.suffixIcon,
    this.prefixIcon,
    this.textStyle,
    this.radius = 8.0,
    this.state = AppButtonState.enabled,
    this.prefixIconHorizontalSpase,
    this.fullBodyColor,
    this.shadowHide = true,
  }) : _type = AppButtonType.primary;

  const AppButton.contrast({
    super.key,
    this.onPressed,
    this.alignment,
    required this.text,
    this.color,
    this.textColor,
    this.width,
    this.height = 57.0,
    this.suffixIcon,
    this.prefixIcon,
    this.textStyle,
    this.radius = 8.0,
    this.state = AppButtonState.enabled,
    this.prefixIconHorizontalSpase,
    this.fullBodyColor,
    this.shadowHide = true,
  }) : _type = AppButtonType.contrast;

  const AppButton.noneBoarder({
    super.key,
    this.onPressed,
    this.alignment,
    required this.text,
    this.color,
    this.textColor,
    this.width,
    this.height = 57.0,
    this.suffixIcon,
    this.prefixIcon,
    this.textStyle,
    this.radius = 8.0,
    this.state = AppButtonState.enabled,
    this.prefixIconHorizontalSpase,
    this.fullBodyColor,
    this.shadowHide = true,
  }) : _type = AppButtonType.noneBoarder;

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case AppButtonType.primary:
        switch (state) {
          case AppButtonState.enabled:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color ?? context.appColor.primary,
                boxShadow: shadowHide ? [] : [
                  BoxShadow(
                    color: color == null
                        ? context.appColor.primary.withOpacity(0.3)
                        : Colors.transparent,
                    blurRadius: 12.0,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  radius ?? 8.0.r,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: alignment ?? MainAxisAlignment.center,
                  mainAxisSize:
                  width != null ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null) 12.horizontalSpace,
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: textColor ?? context.appColor.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                    ),
                    if (suffixIcon != null) 12.horizontalSpace,
                    if (suffixIcon != null) suffixIcon!,
                  ],
                ),
              ),
            );
          case AppButtonState.disabled:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color?.withOpacity(0.5) ??
                    context.appColor.primary.withOpacity(0.5),
                borderRadius: BorderRadius.circular(
                  radius ?? 8.0.r,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: null,
                child: Row(
                  mainAxisAlignment: alignment ?? MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null) 12.horizontalSpace,
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: textColor ?? context.appColor.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                    ),
                    if (suffixIcon != null) 12.horizontalSpace,
                    if (suffixIcon != null) suffixIcon!,
                  ],
                ),
              ),
            );
          case AppButtonState.loading:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color ?? context.appColor.primary,
                boxShadow: [
                  BoxShadow(
                    color: color != null
                        ? color!.withOpacity(0.3)
                        : context.appColor.primary.withOpacity(0.3),
                    blurRadius: 12.0,
                    offset: const Offset(0, 10),
                  ),
                ],
                borderRadius: BorderRadius.circular(
                  radius ?? 8.0.r,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: null,
                child: Row(
                  mainAxisAlignment: alignment ?? MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null) 12.horizontalSpace,
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: textColor ?? context.appColor.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                    ),
                    12.horizontalSpace,
                    AppCupertinoActivityIndicator(
                      activeColor: textColor ?? context.appColor.white,
                    ),
                  ],
                ),
              ),
            );
        }

      case AppButtonType.contrast:
        switch (state) {
          case AppButtonState.enabled:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: fullBodyColor ?? Colors.transparent,
                borderRadius: BorderRadius.circular(radius ?? 8.0.r),
                border: Border.all(
                  color: color ?? context.appColor.primary.withOpacity(0.8),
                  width: 1.0,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize:
                      width != null ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null) 12.horizontalSpace,
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: textColor ?? context.appColor.primary,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                    ),
                    if (suffixIcon != null) 12.horizontalSpace,
                    if (suffixIcon != null) suffixIcon!,
                  ],
                ),
              ),
            );
          case AppButtonState.disabled:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: fullBodyColor ?? Colors.transparent,
                borderRadius: BorderRadius.circular(radius ?? 8.0.r),
                border: Border.all(
                  color: color ?? context.appColor.heading.withOpacity(0.8),
                  width: 1.0,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize:
                      width != null ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null) 12.horizontalSpace,
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: textColor ?? context.appColor.heading,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                    ),
                    if (suffixIcon != null) 12.horizontalSpace,
                    if (suffixIcon != null) suffixIcon!,
                  ],
                ),
              ),
            );
          case AppButtonState.loading:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: fullBodyColor ?? Colors.transparent,
                borderRadius: BorderRadius.circular(radius ?? 8.0.r),
                border: Border.all(
                  color: color ?? context.appColor.heading.withOpacity(0.8),
                  width: 1.0,
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize:
                      width != null ? MainAxisSize.max : MainAxisSize.min,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null) 12.horizontalSpace,
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                color: textColor ?? context.appColor.primary,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.sp,
                              ),
                    ),
                    12.horizontalSpace,
                    AppCupertinoActivityIndicator(
                      activeColor: textColor ?? context.appColor.primary,
                    ),
                  ],
                ),
              ),
            );
        }

      case AppButtonType.noneBoarder:
        switch (state) {
          case AppButtonState.enabled:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color ?? Colors.transparent,
                borderRadius: BorderRadius.circular(radius ?? 8.0.r),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: onPressed,
                child: Row(
                  mainAxisAlignment: alignment ?? MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null)
                      prefixIconHorizontalSpase ?? 12.horizontalSpace,
                    Text(
                      text,
                      maxLines: 2,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: textColor ?? context.appColor.primary,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    if (suffixIcon != null) 12.horizontalSpace,
                    if (suffixIcon != null) suffixIcon!,
                  ],
                ),
              ),
            );
          case AppButtonState.disabled:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color ?? Colors.transparent,
                borderRadius: BorderRadius.circular(radius ?? 8.0.r),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: null,
                child: Row(
                  mainAxisAlignment: alignment ?? MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null)
                      prefixIconHorizontalSpase ?? 12.horizontalSpace,
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: textColor ?? context.appColor.heading,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    if (suffixIcon != null) 12.horizontalSpace,
                    if (suffixIcon != null) suffixIcon!,
                  ],
                ),
              ),
            );
          case AppButtonState.loading:
            return Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: color ?? Colors.transparent,
                borderRadius: BorderRadius.circular(radius ?? 8.0.r),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                height: height,
                onPressed: null,
                child: Row(
                  mainAxisAlignment:alignment ?? MainAxisAlignment.center,
                  children: [
                    if (prefixIcon != null) prefixIcon!,
                    if (prefixIcon != null)
                      prefixIconHorizontalSpase ?? 12.horizontalSpace,
                    Text(
                      text,
                      style: textStyle ??
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: textColor ?? context.appColor.primary,
                                fontWeight: FontWeight.w500,
                              ),
                    ),
                    12.horizontalSpace,
                    AppCupertinoActivityIndicator(
                      activeColor: textColor ?? context.appColor.primary,
                    ),
                  ],
                ),
              ),
            );
        }
    }
  }
}

enum AppButtonType {
  primary,
  contrast,
  noneBoarder,
}

enum AppButtonState {
  enabled,
  disabled,
  loading,
}
