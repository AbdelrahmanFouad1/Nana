import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nana/core/error/exceptions.dart';
import 'package:nana/core/util/resources/common_dependencies.dart'
    show NanaExceptions, NetworkException;
import 'package:nana/features/home/data/remote/source/home_remote_data_source.dart';
import 'package:nana/features/home/data/repository/home_repository_impl.dart';

import '../../../../common/home_mock_data.dart';
import 'home_repository_test.mocks.dart';

// Import the generated mocks
@GenerateMocks([HomeRemoteDataSource])
void main() {
  late HomeRepositoryImpl homeRepositoryImpl;
  late MockHomeRemoteDataSource mockHomeRemoteDataSource;

  setUp(() {
    // Initialize the mock data source
    mockHomeRemoteDataSource = MockHomeRemoteDataSource();
    homeRepositoryImpl = HomeRepositoryImpl(mockHomeRemoteDataSource);
  });

  group('HomeRepository - Products - Testing Getters', () {
    const int limit = 10;
    const int offset = 0;

    test(
        'should return Right with a list of products when remote call is successful',
        () async {
      // Arrange
      when(mockHomeRemoteDataSource.products(limit, offset))
          .thenAnswer((_) async => fakeProductResponse);

      // Act
      final result = await homeRepositoryImpl.products(limit, offset);

      // Assert
      expect(result, Right(fakeProductResponse));
      verify(mockHomeRemoteDataSource.products(limit, offset)).called(1);
      verifyNoMoreInteractions(mockHomeRemoteDataSource);
    });

    test(
        'should return Left with AppExceptions when remote call throws AppExceptions',
        () async {
      // Arrange
      final exception =
          NetworkException(exceptions: Exceptions(exception: 'No internet'));
      when(mockHomeRemoteDataSource.products(limit, offset))
          .thenThrow(exception);

      // Act
      final result = await homeRepositoryImpl.products(limit, offset);

      // Assert
      expect(result, Left(exception));
      verify(mockHomeRemoteDataSource.products(limit, offset)).called(1);
      verifyNoMoreInteractions(mockHomeRemoteDataSource);
    });

    test(
        'should return Left with unknown exception when remote call throws an unexpected exception',
        () async {
      // Arrange
      when(mockHomeRemoteDataSource.products(limit, offset))
          .thenThrow(Exception('Unknown error'));

      // Act
      final result = await homeRepositoryImpl.products(limit, offset);

      // Assert
      expect(result, Left(NanaExceptions.getUnknownException()));
      verify(mockHomeRemoteDataSource.products(limit, offset)).called(1);
      verifyNoMoreInteractions(mockHomeRemoteDataSource);
    });
  });
}
