extension MiscStringExtensions on String? {
  /// Checks if the `String` is Blank (null, empty or only white spaces).
  bool get isBlank => this?.trim().isEmpty ?? true;

  /// Checks if the `String` is not blank (null, empty or only white spaces).
  bool get isNotBlank => isBlank == false;



  String get firstLetterFromFullName {
    // Return an empty string if the input is null
    if (this == null) {
      return '';
    }

    // Trim spaces and split the string into words
    List<String> parts = this!.trim().split(RegExp(r'\s+'));

    // Handle the cases based on the number of parts
    if (parts.isEmpty || parts[0].isEmpty) {
      return '';
    }
    // Single word case: return the first character in uppercase
    if (parts.length == 1) {
      return parts[0][0].toUpperCase();
    }
    // Multiple words case: return the first characters of the first and last words
    return '${parts.first[0].toUpperCase()}${parts.last[0].toUpperCase()}';
  }


}
