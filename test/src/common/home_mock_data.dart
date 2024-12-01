import 'package:nana/features/home/data/models/product_model.dart';

final fakeProductResponse = [
  ProductModel(
    id: 1,
    title: 'Product 1',
    description: 'Description 1',
    price: 100,
    images: ['image1', 'image2'],
    category: Category(
      id: 1,
      image: 'image',
      name: 'Category 1',
      updatedAt: DateTime.now(),
      creationAt: DateTime.now(),
    ),
    creationAt: DateTime.now(),
    updatedAt: DateTime.now(),
  )
];

