import 'package:flutter/material.dart';

class ScrollNotificationListener extends StatelessWidget {
  const ScrollNotificationListener({
    this.onReachLimit,
    this.maxScrollLimit = 100,
    this.totalPageSize,
    this.itemLength,
    this.canLoadMore,
    required this.child,
    super.key,
  });

  final void Function()? onReachLimit;
  final double maxScrollLimit;
  final num? totalPageSize;
  final num? itemLength;
  final bool? canLoadMore;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: _onNotification,
      child: child,
    );
  }

  bool _onNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (isExceedLimit(notification.metrics) && limitPageSize) {
        onReachLimit?.call();
      }
    }
    return false;
  }

  bool isExceedLimit(ScrollMetrics metrics) =>
      metrics.maxScrollExtent - metrics.pixels <= maxScrollLimit;

  bool get limitPageSize {
    if (totalPageSize != null && itemLength != null) {
      return totalPageSize! > itemLength!;
    } else if (!(canLoadMore ?? true)) {
      return false;
    } else {
      return true;
    }
  }
}
