import 'package:flutter/material.dart';
import 'package:learningcards/app/app_theme.dart';
import 'package:learningcards/features/common/domain/common_models.dart';
import 'package:learningcards/features/following/domain/following_card_model.dart';
import 'package:learningcards/features/following/presentation/following_back.dart';
import 'package:learningcards/features/following/presentation/following_front.dart';
import 'package:learningcards/features/foryou/domain/for_you_card_model.dart';
import 'package:learningcards/network/api_error.dart';

extension BuildContextX on BuildContext {
  ThemeData get appTheme => Theme.of(this);
  TextTheme get textTheme => appTheme.textTheme;
  AppColors get appColors => appTheme.extension<AppColors>()!;

  Size get screenSize => MediaQuery.of(this).size;
}

extension ApiErrorX on ApiError {
  String get errorMessage => when(
        notImplemented: () {
          return 'error_not_implemented';
        },
        requestCancelled: () {
          return 'error_request_cancel';
        },
        internalServerError: () {
          return 'error_internal';
        },
        notFound: (String reason) {
          return reason;
        },
        serviceUnavailable: () {
          return 'error_service_unavailable';
        },
        methodNotAllowed: () {
          return 'error_method_allowed';
        },
        badRequest: () {
          return 'error_bad_request';
        },
        unauthorisedRequest: () {
          return 'error_unauthorised_request';
        },
        unexpectedError: () {
          return 'error_unexpected';
        },
        requestTimeout: () {
          return 'error_request_timeout';
        },
        noInternetConnection: () {
          return 'error_no_internet';
        },
        conflict: () {
          return 'error_conflict';
        },
        sendTimeout: () {
          return 'error_api_connection_timeout';
        },
        unableToProcess: () {
          return 'error_process_data';
        },
        defaultError: (String error) {
          return error;
        },
        formatException: () {
          return 'error_unexpected';
        },
        notAcceptable: () {
          return 'error_not_acceptable';
        },
      );
}

extension FlashcardFeedbackEnumX on FlashcardFeedbackEnum {
  int get toValue {
    switch (this) {
      case FlashcardFeedbackEnum.bad:
        return 1;
      case FlashcardFeedbackEnum.notbad:
        return 2;
      case FlashcardFeedbackEnum.normal:
        return 3;
      case FlashcardFeedbackEnum.good:
        return 4;
      case FlashcardFeedbackEnum.great:
        return 5;
      default:
        throw Exception('Invalid FlashcardFeedbackEnum value');
    }
  }

  Color toColor(BuildContext context) {
    final colors = context.appColors;
    switch (this) {
      case FlashcardFeedbackEnum.bad:
        return colors.score1!;
      case FlashcardFeedbackEnum.notbad:
        return colors.score2!;
      case FlashcardFeedbackEnum.normal:
        return colors.score3!;
      case FlashcardFeedbackEnum.good:
        return colors.score4!;
      case FlashcardFeedbackEnum.great:
        return colors.score5!;
    }
  }
}

abstract class CardVisitor<T> {
  T visitFlashcard(FollowingCard flashcard, {Map<String, dynamic>? props});
  T visitMultipleChoice(ForYouCard multipleChoice, {Map<String, dynamic>? props});
}

class CardWidgetVisitor implements CardVisitor<Widget> {
  @override
  Widget visitFlashcard(FollowingCard flashcard, {Map<String, dynamic>? props}) {
    final showAnswer = props?['showAnswer'] ?? false;
    return !showAnswer
        ? FollowingFront(question: flashcard.flashcardFront)
        : FollowingBack(
            question: flashcard.flashcardFront,
            answer: flashcard.flashcardBack,
          );
  }

  @override
  Widget visitMultipleChoice(ForYouCard multipleChoice, {Map<String, dynamic>? props}) {
    // TODO: implement visitMultipleChoice
    throw UnimplementedError();
  }
}
