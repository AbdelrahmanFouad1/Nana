import 'package:nana/core/util/resources/common_dependencies.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';



@module
abstract class AppModule {
  @lazySingleton
  Dio dio() {
    final dio = Dio(BaseOptions(
      baseUrl: AppEndpoint.baseUrl,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      sendTimeout: const Duration(minutes: 1),
    ));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 90));

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (
            RequestOptions options,
            RequestInterceptorHandler handler,
            ) async {
          inject<CacheHelper>().get(ConstantsManger.token).then(
                (value) {
              if (value != null) {
                AppLogs.info('$value', 'Token');
                options.headers.addAll({
                  'Authorization': 'Bearer $value',
                });
              }
            },
          );

          options.headers.addAll({
            'Accept-Language': LanguageManager.currentLanguageCode,
            'Accept': 'application/json',
          });

          return handler.next(options);
        },
      ),
    );
    return dio;
  }
}
