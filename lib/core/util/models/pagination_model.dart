class PaginationModel<T> {
  final T? data;
  final int total;
  final int currentPage;
  final int lastPage;
  final int perPage;

  PaginationModel({
    this.data,
    required this.total,
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
  });

  factory PaginationModel.fromJson(
      Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return PaginationModel<T>(
      data: json['list'] == null ? null : fromJsonT(json['list']),
      total: json['total'] as int,
      currentPage: json['current_page'] as int,
      lastPage: json['last_page'] as int,
      perPage: json['per_page'] as int,
    );
  }

  Map<String, dynamic> toJson(Object Function(T) toJsonT) {
    return {
      'list': toJsonT(data as T),
      'total': total,
      'current_page': currentPage,
      'last_page': lastPage,
      'per_page': perPage,
    };
  }
}
