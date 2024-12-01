import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:flutter/material.dart';

/// this class work as an indicator for request max retries number
///     example :
/// ```dart
///  ...
///      showCustomToast(
///      message: exceptions.error,
///      context: context,
///      maxRetries: 2 (Default), -> try request enabled when maxRetries != 0 & 1,
///      action: (){
///         exampleAsyncAction();
///       },
///      );
/// ...
/// ```
///
/// Notes:
/// * retry numbers should be from host widget
/// * [_RetryIndicator.canRetry] check if max limit exceeded
/// * on click it will decrease retries number in [_RetryIndicator._retriesIndicator]
/// * [_RetryIndicator.widgetRuntimeType] will be removed from
///   [_RetryIndicator._retriesIndicator] in last possible try
///
class _RetryIndicator {
  final String widgetRuntimeType;

  _RetryIndicator(this.widgetRuntimeType);

  static final Map<String, int> _retriesIndicator = {};

  /// check it [widgetRuntimeType] is exist in [_retriesIndicator]
  /// if not exist create one
  createIndicator(int value) {
    if (!_retriesIndicator.containsKey(widgetRuntimeType)) {
      _retriesIndicator.addAll({widgetRuntimeType: value});
    }
  }

  _onKeyExisted(key, fn) {
    if (_retriesIndicator.containsKey(key)) {
      if (_retriesIndicator[widgetRuntimeType] != null) {
        return fn.call();
      }
    }
  }

  int get numberOfRetries => _retriesIndicator[widgetRuntimeType] ?? 0;

  bool canRetry() {
    bool canRetry = false;
    _onKeyExisted(widgetRuntimeType, () {
      final remainingRetries = _retriesIndicator[widgetRuntimeType];
      if ((remainingRetries!) >= 1) {
        canRetry = true;
      } else {
        _removeId();
        canRetry = false;
      }
    });

    return canRetry;
  }

  _removeId() => _retriesIndicator.remove(widgetRuntimeType);

  decreaseIndicator() {
    _onKeyExisted(widgetRuntimeType, () {
      _retriesIndicator.update(widgetRuntimeType, (value) => --value);
    });
  }
}

typedef ErrorAction = Function(bool)?;

mixin ToastMixin on Widget {
  showCustomToast({
    required BuildContext context,
    required String message,
    required ToastState state,
    Widget? icon,
    GestureTapCallback? action,
    int maxRetries = 2,
    bool withBottomNav = false,
    VoidCallback? onDismissed,
  }) async {
    final retryIndicator = _RetryIndicator(toStringShort());
    retryIndicator.createIndicator(maxRetries);

    ScaffoldMessenger.of(context)
        .showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
        ),
        dismissDirection: DismissDirection.horizontal,
        padding: EdgeInsets.symmetric(
            vertical: 12.h, horizontal: state.padding.w),
        elevation: 0,
        backgroundColor: state.backGroundColor,
        behavior: SnackBarBehavior.floating,
        duration: state == ToastState.failure
            ? const Duration(seconds: 6)
            : state == ToastState.success
            ? const Duration(seconds: 2)
            : const Duration(seconds: 4),
        margin: EdgeInsets.symmetric(
            horizontal: 24.w, vertical: withBottomNav ? 24.h : 0),
        content: Row(
          children: [
            icon ?? iconsWidget(state),
            8.horizontalSpace,
            Expanded(
              child: Text(
                message,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: state.textColor,
                ),
              ),
            ),
            if (state == ToastState.failure) ...[
              16.horizontalSpace,
              AppButton(
                text: context.retry,
                height: 36.h,
                color: context.appColor.black,
                onPressed: (retryIndicator.canRetry() && action != null)
                    ? () async {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  if (retryIndicator.canRetry()) {
                    retryIndicator.decreaseIndicator();
                    action.call();
                  }
                }
                    : null,
              ),
            ]
          ],
        ),
      ),
    )
        .closed
        .then((reason) {
      if (onDismissed != null) {
        onDismissed.call();
      }
    });
  }
}

Widget iconsWidget(ToastState state) {
  switch (state) {
    case ToastState.success:
      return Assets.icons.tickCircleSucess.svg();
    case ToastState.info:
      return Assets.icons.infoCircle.svg();
    case ToastState.warning:
      return Assets.icons.cloudChange.svg();
    case ToastState.error:
      return Assets.icons.danger.svg();
    case ToastState.failure:
      return Assets.icons.cloudCross.svg();
  }
}

enum ToastState {
  success(
    Color(HxaColorsLight.successColor),
    Color(HxaColorsLight.successBGColor),
    16,
  ),
  warning(
    Color(HxaColorsLight.warningColor),
    Color(HxaColorsLight.warningBGColor),
    16,
  ),
  info(
    Color(HxaColorsLight.infoColor),
    Color(HxaColorsLight.infoBGColor),
    16,
  ),
  error(
    Color(HxaColorsLight.errorColor),
    Color(HxaColorsLight.errorBGColor),
    16,
  ),
  failure(
    Color(HxaColorsLight.errorColor),
    Color(HxaColorsLight.errorBGColor),
    12,
  );

  const ToastState(this.textColor, this.backGroundColor, this.padding);

  final Color textColor;
  final Color backGroundColor;
  final double padding;
}
