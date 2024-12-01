import 'package:flutter/foundation.dart';

class AppLogs{
  ///* Info
  static info(String message, [String tag = 'Info']){
    if (kDebugMode) {
      print('$tag: 🔊🔊🔊🔊🔊🔊🔊🔊🔊🔊=> $message');
    }
  }

  ///* Error
  static error(String message, [String tag = 'Error']){
    if (kDebugMode) {
      print('$tag: ❌❌❌❌❌❌❌❌❌❌❌❌=> $message');
    }
  }

  ///* Success
  static success(String message, [String tag = 'Success']){
    if (kDebugMode) {
      print('$tag: ✅✅✅✅✅✅✅✅✅✅✅✅=> $message');
    }
  }

  ///* Warning
  static warning(String message, [String tag = 'Warning']){
    if (kDebugMode) {
      print('$tag: ⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️⚠️=> $message');
    }
  }

  ///* Debug
  static debug(String message, [String tag = 'Debug']){
    if (kDebugMode) {
      print('$tag: 🐞🐞🐞🐞🐞🐞🐞🐞🐞🐞🐞🐞=> $message');
    }
  }
}