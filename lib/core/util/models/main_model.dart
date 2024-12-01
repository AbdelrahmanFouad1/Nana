class MainModel<T> {
  final num? count;
  final T? data;

  MainModel({
    this.count,
    this.data,
  });

  factory MainModel.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return MainModel<T>(
      count: json['count'] as int?,
      data: json['data'] == null ? null : fromJsonT(json['data']),
    );
  }

  Map<String, dynamic> toJson(Object Function(T) toJsonT) {
    return {
      'count': count,
      'data': toJsonT(data as T),
    };
  }
}
