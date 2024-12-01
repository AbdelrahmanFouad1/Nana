import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nana/core/util/resources/common_dependencies.dart'
    show BlocProvider, Exceptions, NetworkException;
import 'package:nana/features/home/domain/usecases/products_usecase.dart';
import 'package:nana/features/home/presentation/cubit/home_cubit.dart';
import 'package:nana/features/home/presentation/cubit/home_state.dart';

import '../../../../common/home_mock_data.dart';
import 'home_cubit_test.mocks.dart';

@GenerateMocks([ProductsUseCase])
void main() {
  late HomeCubit homeCubit;
  late MockProductsUseCase mockProductsUseCase;

  setUp(() {
    mockProductsUseCase = MockProductsUseCase();
    homeCubit = HomeCubit(mockProductsUseCase);
  });

  tearDown(() {
    homeCubit.close();
  });

  group('HomeCubit - Testing Getters', () {
    final mockException =
        NetworkException(exceptions: Exceptions(exception: 'No Internet'));

    testWidgets(
        'HomeCubit.get(context) retrieves the cubit instance from the context',
        (tester) async {
      // Arrange
      await tester.pumpWidget(
        BlocProvider<HomeCubit>(
          create: (_) => homeCubit,
          child: Builder(
            builder: (context) {
              // Act
              final cubit = HomeCubit.get(context);

              // Assert
              expect(cubit, equals(homeCubit));
              return const SizedBox();
            },
          ),
        ),
      );
    });

    test('initial state should be HomeState.initial', () {
      expect(homeCubit.state, const HomeState.initial());
    });

    test('productsRecommendation getter should return _productsRecommendation', () async {
      // Arrange
      when(mockProductsUseCase.call(any))
          .thenAnswer((_) async => Right(fakeProductResponse));

      // Act
      await homeCubit.products();
      final result = homeCubit.productsRecommendation;

      // Assert
      expect(result, equals(fakeProductResponse));
    });

    test('productsMostUsed getter should return _productsMostUsed', () async {
      // Arrange
      when(mockProductsUseCase.call(any))
          .thenAnswer((_) async => Right(fakeProductResponse));

      // Act
      await homeCubit.products(); // Ensure the list is populated
      final result = homeCubit.productsMostUsed;

      // Assert
      expect(result, equals(fakeProductResponse));
    });

    blocTest<HomeCubit, HomeState>(
      'emits [HomeState.productsLoading, HomeState.productsLoaded] on success for non-pagination',
      build: () => homeCubit,
      setUp: () {
        when(mockProductsUseCase.call(any))
            .thenAnswer((_) async => Right(fakeProductResponse));
      },
      act: (cubit) => cubit.products(),
      expect: () => [
        const HomeState.productsLoading(),
        HomeState.productsLoaded(fakeProductResponse),
      ],
      verify: (_) {
        verify(mockProductsUseCase.call(any)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [HomeState.productsLoadingMore, HomeState.productsLoadedMore] on success for pagination',
      build: () => homeCubit,
      setUp: () {
        when(mockProductsUseCase.call(any))
            .thenAnswer((_) async => Right(fakeProductResponse));
      },
      act: (cubit) => cubit.products(pagination: true),
      expect: () => [
        const HomeState.productsLoadingMore(),
        HomeState.productsLoadedMore(fakeProductResponse, true),
      ],
      verify: (_) {
        verify(mockProductsUseCase.call(any)).called(1);
      },
    );

    blocTest<HomeCubit, HomeState>(
      'emits [HomeState.productsLoading, HomeState.productsError] on failure for non-pagination',
      build: () => homeCubit,
      setUp: () {
        when(mockProductsUseCase.call(any))
            .thenAnswer((_) async => Left(mockException));
      },
      act: (cubit) => cubit.products(),
      expect: () => [
        const HomeState.productsLoading(),
        HomeState.productsError(mockException),
      ],
      verify: (_) {
        verify(mockProductsUseCase.call(any)).called(1);
      },
    );

  });
}
