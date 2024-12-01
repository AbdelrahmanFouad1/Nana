import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension DateTimeFormat on DateTime {
  /// un comment this if you want to use the default locale language (when app is ar)
  String get dmy => DateFormat('dd/MM/yyyy').format(this);

  String get formatMonthName => DateFormat('d MMMM yyyy').format(this);

  String get hm => DateFormat(DateFormat.HOUR_MINUTE).format(this);

  String get dayAndHour => DateFormat('Hm').format(this);

  String hourAMPM(Locale locale) =>
      DateFormat.jm(locale.languageCode).format(this);

  /// This method will return "3 hrs ago" like format
  String get timeAgo {
    DateTime currentTime = DateTime.now();
    Duration difference = currentTime.difference(this);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} seconds ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} minutes ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hrs ago';
    } else if (difference.inDays < 30) {
      return '${difference.inDays} days ago';
    } else {
      return DateFormat('yMMMd').format(this); // e.g., "Sep 5, 2024"
    }
  }
}

extension Theming on BuildContext {
  AppColor get appColor => Theme.of(this).extension<AppColor>()!;

  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  ThemeData get theme => Theme.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;
}


extension MiscDurationExtensions on Duration {
  /// Formats a [Duration] into a string with the "MM:SS" format.
  ///
  /// This function converts a [Duration] to a "MM:SS" string, ensuring
  /// two-digit minutes and seconds, padded with leading zeros if necessary.
  ///
  /// Example:
  /// - 3 minutes and 5 seconds becomes "03:05".
  /// - 12 minutes and 45 seconds becomes "12:45".
  ///
  /// Returns:
  /// - A [String] in the "MM:SS" format.
  String get formatDuration {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }
}

// Extension to check if the device is a tablet
extension DeviceTypeExtensions on BuildContext {
  bool get isTablet {
    return 1.sw > 600; // Threshold for tablets
  }
}
