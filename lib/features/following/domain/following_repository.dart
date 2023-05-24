import 'package:learningcards/features/following/domain/following_card_model.dart';
import 'package:learningcards/network/api_result.dart';

abstract class FollowingRepository {
  Future<ApiResult<List<FollowingCard>>> getFollowingCards();
}
