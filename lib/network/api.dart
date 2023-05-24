import 'package:injectable/injectable.dart';
import 'package:learningcards/app/app_config.dart';
import 'package:learningcards/features/following/domain/following_card_model.dart';
import 'package:learningcards/features/foryou/domain/for_you_card_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart' hide Headers;

part 'api.g.dart';

@RestApi(baseUrl: 'https://cross-platform.rp.devfactory.com')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String? baseUrl}) = _ApiClient;

  @GET('/following')
  Future<FollowingCard> getFollowings();

  @GET('/for_you')
  Future<ForYouCard> getForYous();

  @GET('/for_you/{id}')
  Future<ForYouCard> getForYouAnswer(@Path('id') int id);
}

@module
abstract class RegisterModule {
/*   ApiClient getService(Dio dio, @factoryParam String url) =>
      ApiClient(dio, baseUrl: url); */
  ApiClient getService(Dio dio, Config config) => ApiClient(dio, baseUrl: config.baseUrl);
}
