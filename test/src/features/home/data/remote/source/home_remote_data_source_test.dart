import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nana/core/util/resources/common_dependencies.dart'
    show AppExceptions, DioException, DioExceptionType, RequestOptions;
import 'package:nana/features/home/data/remote/service/home_service.dart';
import 'package:nana/features/home/data/remote/source/home_remote_data_source_impl.dart';
import '../../../../../common/home_mock_data.dart';
import 'home_remote_data_source_test.mocks.dart';

@GenerateMocks([HomeService, RequestOptions])
void main() {
  late HomeRemoteDataSourceImpl dataSource;
  late MockHomeService mockService;

  setUp(() {
    mockService = MockHomeService();
    dataSource = HomeRemoteDataSourceImpl(mockService);
  });

  group('HomeRepository - RemoteDataSource - Testing Getters', () {
    const int limit = 10;
    const int offset = 0;

    test('should return a list of ProductModel when the service call is successful', () async {
      // Arrange
      when(mockService.products(limit, offset)).thenAnswer((_) async => fakeProductResponse);

      // Act
      final result = await dataSource.products(limit, offset);

      // Assert
      expect(result, fakeProductResponse);
      verify(mockService.products(limit, offset)).called(1);
      verifyNoMoreInteractions(mockService);
    });

    test('should throw DioException when the service call throws DioException', () async {
      // Arrange
      final dioException = DioException(
        requestOptions: RequestOptions(path: ''),
        type: DioExceptionType.connectionTimeout,
      );
      when(mockService.products(limit, offset)).thenThrow(dioException);

      // Act
      final call = dataSource.products;

      // Assert
      expect(() => call(limit, offset), throwsA(isA<AppExceptions>()));
      verify(mockService.products(limit, offset)).called(1);
      verifyNoMoreInteractions(mockService);
    });

    test('should throw a mapping data exception for an unexpected exception', () async {
      // Arrange
      final unexpectedException = Exception('Unexpected error');
      when(mockService.products(limit, offset)).thenThrow(unexpectedException);

      // Act
      final call = dataSource.products;

      // Assert
      expect(() => call(limit, offset), throwsA(isA<AppExceptions>()));
      verify(mockService.products(limit, offset)).called(1);
      verifyNoMoreInteractions(mockService);
    });
  });

}

