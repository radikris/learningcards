import 'package:injectable/injectable.dart';
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
  Future<ApiResult<FollowingCard>> getFollowingCards() async {
    try {
      final result = await _api.getFollowings();
      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.error(ApiError.fromDioException(error));
    }
  }
}
