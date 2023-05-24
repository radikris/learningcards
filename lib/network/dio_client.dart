import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:learningcards/app/app_config.dart';

@module
abstract class DioInjectableModule {
  Dio getDio(Config config) {
    final cacheOption = CacheOptions(
      store: MemCacheStore(),
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 7),
    );
    return Dio(
      BaseOptions(
        contentType: 'application/json',
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 15),
        baseUrl: config.baseUrl,
      ),
    )
      /*    ..interceptors.add(
        DioCacheManager(CacheConfig(baseUrl: config.baseUrl)).interceptor as Interceptor,
      ) */
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            final apiKey = config.apiKey;
            /*       
     TODO ADD CACHE OPTION
      final cacheOption = buildCacheOptions(Duration(days: 7));
            print(cacheOption.headers);
            options.headers.addAll(
              {'x-api-key': apiKey, 'User-Agent': 'best_practice_template'},
            );
            options.headers.addAll(cacheOption.headers!);
            debugPrint(buildCacheOptions(Duration(days: 7)).toString()); */
            debugPrint('::: Api Url : ${options.uri}');
            debugPrint('::: Api header : ${options.headers}');

            return handler.next(options);
          },
          onResponse: (response, handler) {
            debugPrint('::: Api response : $response');
            print(response.statusCode);
            return handler.next(response);
          },
          onError: (DioError e, handler) {
            debugPrint('::: Api error : $e');
            return handler.next(e);
          },
        ),
      )
      ..interceptors.add(DioCacheInterceptor(options: cacheOption));
  }
}
