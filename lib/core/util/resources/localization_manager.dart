import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

extension AppLocalization on BuildContext {
 String get success => tr('success', context: this);
 String get error => tr('error', context: this);
 String get info => tr('info', context: this);
 String get warning => tr('warning', context: this);
 String get cancel => tr('cancel', context: this);
 String get retry => tr('retry', context: this);
 String get skip => tr('skip', context: this);
 String get next => tr('next', context: this);
 String get back => tr('back', context: this);
 String get continueText => tr('continue_text', context: this);
 String get apply => tr('apply', context: this);
 String get submit => tr('submit', context: this);
 String get addText => tr('add_text', context: this);
 String get home => tr('home', context: this);
 String get cart => tr('cart', context: this);
 String get rewards => tr('rewards', context: this);
 String get menu => tr('menu', context: this);
 String get sar => tr('sar', context: this);
 String get loadMore => tr('load_more', context: this);
 String get recommendation => tr('recommendation', context: this);
 String get mostUseProducts => tr('most_use_products', context: this);
 String get generalErrorMessage => tr('general_error_message', context: this);
}