import 'package:injectable/injectable.dart';
import 'package:learningcards/app/app_config.dart';
import 'package:learningcards/features/following/domain/following_card_model.dart';
import 'package:learningcards/features/following/domain/following_repository.dart';
import 'package:learningcards/network/api.dart';
import 'package:learningcards/network/api_error.dart';
import 'package:learningcards/network/api_result.dart';

@Environment(Environment.prod)
@LazySingleton(as: FollowingRepository)
class FollowingRepositoryImpl implements FollowingRepository {
  FollowingRepositoryImpl(this._api);

  final ApiClient _api;

  @override
  Future<ApiResult<List<FollowingCard>>> getFollowingCards() async {
    try {
      //TODO this pagination not working properly in my opinion, we need to work with list of data to prefetch
      final results = await Future.wait(
        List.generate(AppConstants.PAGE_SIZE, (_) => _api.getFollowings()),
      );

      return ApiResult.success(results);
    } catch (error) {
      return ApiResult.error(ApiError.fromDioException(error));
    }
  }
}
