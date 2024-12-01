import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nana/core/util/resources/common_dependencies.dart'
    show AppExceptions;
import 'package:nana/features/home/domain/repository/home_repository.dart';
import 'package:nana/features/home/domain/usecases/products_usecase.dart';

import '../../../common/home_mock_data.dart';
import 'products_usecase_test.mocks.dart';

@GenerateMocks([HomeRepository])
void main() {
  final mockRepository = MockHomeRepository();
  ProductsUseCase useCase = ProductsUseCase(mockRepository);

  group('ProductsUseCase - Testing Getters', () {
    test(
      'Should call Get Products method on repository',
      () async {
        // arrange
        when(mockRepository.products(10, 0))
            .thenAnswer((_) async => Right(fakeProductResponse));

        // act
        final result = await useCase(PaginationData(limit: 10, offset: 0));

        // assert
        result.fold((l) => null, (r) {
          expect(r, fakeProductResponse);
        });
        verify(mockRepository.products(10, 0)).called(1);
      },
    );

    test(
      'Should return left if repository throws an app exception',
      () async {
        // arrange
        when(mockRepository.products(10, 0))
            .thenAnswer((_) => Future.value(Left(AppExceptions())));

        // act
        final result = await useCase(PaginationData(limit: 10, offset: 0));

        // assert
        expect(result.isLeft(), true);
      },
    );
  });
}
