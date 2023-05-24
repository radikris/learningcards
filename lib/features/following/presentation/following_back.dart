import 'package:flutter/material.dart';
import 'package:learningcards/app/app_config.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/common/domain/common_models.dart';
import 'package:learningcards/features/following/application/bloc/following_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningcards/features/following/domain/following_card_model.dart';

class FollowingBack extends StatefulWidget {
  final FollowingCard followingCard;
  final int? selectedAnswer;
  const FollowingBack({super.key, required this.followingCard, this.selectedAnswer});

  @override
  State<FollowingBack> createState() => _FollowingBackState();
}

class _FollowingBackState extends State<FollowingBack> {
  FlashcardFeedbackEnum? answerClicked;

  void onTap(FlashcardFeedbackEnum value) {
    final bloc = context.read<FollowingBloc>();

    setState(() {
      answerClicked = value;
    });
    bloc.add(SelectAnswerCardEvent(cardId: widget.followingCard.id, answer: value.toValue));
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colors = context.appColors;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: AppDimen.h130 * 1.5),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: AppDimen.h10,
              ),
              Text(
                widget.followingCard.flashcardFront,
                style: textTheme.bodyLarge,
              ),
              SizedBox(
                height: AppDimen.h10,
              ),
              Divider(
                thickness: AppDimen.h4,
                color: colors.disabled,
              ),
              SizedBox(
                height: AppDimen.h10,
              ),
              Text(
                'Answer',
                style: textTheme.bodySmall!.copyWith(color: colors.success!, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: AppDimen.h4,
              ),
              Text(
                widget.followingCard.flashcardBack,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: AppDimen.h100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'How well did you know this?',
                style: textTheme.bodySmall,
              ),
              SizedBox(
                height: AppDimen.h10,
              ),
              SizedBox(
                  height: AppDimen.h45,
                  width: context.screenSize.width - AppDimen.w100,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: AppConstants.ANIMATION_DURATION),
                    transitionBuilder: (Widget child, Animation<double> animation) {
                      return ScaleTransition(scale: animation, child: child);
                    },
                    child: (answerClicked != null)
                        ? AnimatedSize(
                            duration: Duration(milliseconds: AppConstants.ANIMATION_DURATION),
                            child: Container(
                              height: AppDimen.h45,
                              width: answerClicked != null ? double.infinity : 0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppDimen.r12),
                                color: answerClicked!.toColor(context),
                              ),
                              child: Center(child: Text(answerClicked!.toValue.toString())),
                            ),
                          )
                        : widget.selectedAnswer != null
                            ? Container(
                                height: AppDimen.h45,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppDimen.r12),
                                  color: widget.selectedAnswer!.toFlashCardValue.toColor(context),
                                ),
                                child: Center(child: Text(widget.selectedAnswer!.toFlashCardValue.toValue.toString())),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: FlashcardFeedbackEnum.values
                                    .map((e) => GestureDetector(
                                          onTap: widget.selectedAnswer != null ? null : () => onTap(e),
                                          child: AnimatedSize(
                                            duration: Duration(milliseconds: AppConstants.ANIMATION_DURATION),
                                            child: Container(
                                              height: AppDimen.h45,
                                              width: widget.selectedAnswer != null && widget.selectedAnswer != e
                                                  ? 0
                                                  : AppDimen.w45,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(AppDimen.r12),
                                                color: e.toColor(context),
                                              ),
                                              child: Center(child: Text(e.toValue.toString())),
                                            ),
                                          ),
                                        ))
                                    .toList(),
                              ),
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
