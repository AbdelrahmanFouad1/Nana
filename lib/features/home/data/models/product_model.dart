import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "price")
  final int? price;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(
    name: "images",
    fromJson: _cleanImages,
  )
  final List<String>? images;
  @JsonKey(name: "creationAt")
  final DateTime? creationAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;
  @JsonKey(name: "category")
  final Category? category;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    List<String>? images,
    DateTime? creationAt,
    DateTime? updatedAt,
    Category? category,
  }) =>
      ProductModel(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        images: images ?? this.images,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  /// Function to clean and normalize the images field
  static List<String>? _cleanImages(dynamic images) {
    if (images is List) {
      // Case 1: Direct list of strings, clean unnecessary characters
      return images.map((e) =>
          e.toString().replaceAll(RegExp(r'[\\\[\]\"]'), '')).toList();
    }
    return null; // Handle invalid or null cases gracefully
  }
}

@JsonSerializable()
class Category {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "name")
  final String? name;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "creationAt")
  final DateTime? creationAt;
  @JsonKey(name: "updatedAt")
  final DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category copyWith({
    int? id,
    String? name,
    String? image,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
