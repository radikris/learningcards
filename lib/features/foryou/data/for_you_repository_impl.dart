import 'package:injectable/injectable.dart';
import 'package:learningcards/app/app_config.dart';
import 'package:learningcards/features/foryou/domain/for_you_answer_model.dart';
import 'package:learningcards/features/foryou/domain/for_you_card_model.dart';
import 'package:learningcards/features/foryou/domain/for_you_repository.dart';
import 'package:learningcards/network/api.dart';
import 'package:learningcards/network/api_error.dart';
import 'package:learningcards/network/api_result.dart';

@Environment(Environment.prod)
@LazySingleton(as: ForYouRepository)
class ForYouRepositoryImpl implements ForYouRepository {
  ForYouRepositoryImpl(this._api);

  final ApiClient _api;

  @override
  Future<ApiResult<List<ForYouCard>>> getForYouCards() async {
    try {
      //TODO this pagination not working properly in my opinion, we need to work with list of data to prefetch
      final results = await Future.wait(
        List.generate(AppConstants.PAGE_SIZE, (_) => _api.getForYous()),
      );

      return ApiResult.success(results);
    } catch (error) {
      return ApiResult.error(ApiError.fromDioException(error));
    }
  }

  @override
  Future<ApiResult<ForYouAnswerModel>> getAnswersForQuestion(int id) async {
    try {
      final result = await _api.getForYouAnswer(id.toString());

      return ApiResult.success(result);
    } catch (error) {
      return ApiResult.error(ApiError.fromDioException(error));
    }
  }
}
