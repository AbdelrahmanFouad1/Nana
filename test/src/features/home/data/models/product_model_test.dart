import 'package:flutter_test/flutter_test.dart';
import 'package:nana/features/home/data/models/product_model.dart';

void main() {
  group('Category Model - Testing Getters', () {
    test('fromJson and toJson', () {
      final Map<String, dynamic> categoryJson = {
        "id": 1,
        "name": "Category Name",
        "image": "image.png",
        "creationAt": "2024-12-01T00:00:00.000",
        "updatedAt": "2024-12-01T00:00:00.000",
      };

      final category = Category.fromJson(categoryJson);
      expect(category.id, 1);
      expect(category.name, 'Category Name');
      expect(category.image, 'image.png');
      expect(category.creationAt, DateTime.parse('2024-12-01T00:00:00.000'));
      expect(category.updatedAt, DateTime.parse('2024-12-01T00:00:00.000'));

      final categoryJsonConverted = category.toJson();
      expect(categoryJsonConverted, categoryJson);
    });

    test('copyWith', () {
      final category = Category(
        id: 1,
        name: 'Category Name',
        image: 'image.png',
        creationAt: DateTime.parse('2024-12-01T00:00:00.000'),
        updatedAt: DateTime.parse('2024-12-01T00:00:00.000'),
      );

      final updatedCategory = category.copyWith(name: 'Updated Category Name');

      expect(updatedCategory.name, 'Updated Category Name');
      expect(updatedCategory.id, category.id); // Should retain old value
    });
  });

  group('ProductModel - Testing Getters', () {
    test('copyWith', () {
      final product = ProductModel(
        id: 1,
        title: 'Product Title',
        price: 100,
        description: 'Description of the product',
        images: ['image1', 'image2'],
        creationAt: DateTime.parse('2024-12-01T00:00:00.000'),
        updatedAt: DateTime.parse('2024-12-01T00:00:00.000'),
        category:
            Category(id: 1, name: 'Category Name', image: 'category_image.png'),
      );

      final updatedProduct = product.copyWith(title: 'Updated Product Title');

      expect(updatedProduct.title, 'Updated Product Title');
      expect(updatedProduct.id, product.id); // Should retain old value
      expect(updatedProduct.category?.name,
          product.category?.name); // Should retain old category
    });
  });
}
