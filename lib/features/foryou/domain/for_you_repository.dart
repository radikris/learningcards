import 'package:learningcards/features/foryou/domain/for_you_answer_model.dart';
import 'package:learningcards/features/foryou/domain/for_you_card_model.dart';
import 'package:learningcards/network/api_result.dart';

abstract class ForYouRepository {
  Future<ApiResult<List<ForYouCard>>> getForYouCards();
  Future<ApiResult<ForYouAnswerModel>> getAnswersForQuestion(int id);
}
