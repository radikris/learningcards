import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learningcards/app/app_dimen.dart';
import 'package:learningcards/app/app_extensions.dart';
import 'package:learningcards/features/foryou/application/bloc/for_you_bloc.dart';
import 'package:learningcards/features/foryou/domain/for_you_card_model.dart';
import 'package:learningcards/gen/assets.gen.dart';

class ForYouCardShow extends StatefulWidget {
  final ForYouCard forYouCard;

  final String? selectedAnswer;
  final List<String>? correctAnswers;
  final bool? showAnswer;
  const ForYouCardShow(
      {super.key, required this.forYouCard, this.selectedAnswer, this.showAnswer, this.correctAnswers});

  @override
  State<ForYouCardShow> createState() => _ForYouCardShowState();
}

class _ForYouCardShowState extends State<ForYouCardShow> {
  Color? optionColorized(Option option) {
    final colors = context.appColors;

    if (widget.correctAnswers == null || widget.showAnswer == false) return null;

    if (widget.correctAnswers!.contains(option.id)) return colors.success;
    if (!widget.correctAnswers!.contains(option.id) && option.id == widget.selectedAnswer) return colors.failure;

    return null;
  }

  Widget? optionIcon(Option option) {
    if (widget.correctAnswers == null || widget.showAnswer == false) return null;

    if (widget.correctAnswers!.contains(option.id)) return Assets.mcqSuccess.svg();

    if (!widget.correctAnswers!.contains(option.id) && option.id == widget.selectedAnswer) {
      return Assets.mcqFailure.svg();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final bloc = context.read<ForYouBloc>();
    return Container(
      margin: EdgeInsets.only(bottom: AppDimen.h100),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                SizedBox(
                  height: AppDimen.h10,
                ),
                Text(
                  widget.forYouCard.question,
                  style: textTheme.bodyLarge,
                ),
                SizedBox(
                  height: AppDimen.h10,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(right: AppDimen.w16),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.forYouCard.options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final option = widget.forYouCard.options[index];
                    return InkWell(
                      onTap: widget.showAnswer == true
                          ? null
                          : () {
                              bloc.add(SelectAnswerCardEvent(cardId: widget.forYouCard.id, answer: option.id));
                            },
                      child: Card(
                        color: optionColorized(option),
                        child: ListTile(
                          trailing: optionIcon(option),
                          title:
                              Text(option.answer, style: context.textTheme.bodyMedium!.copyWith(color: Colors.white)),
                          /*  color: optionColorized(option),
                          margin: AppDimen.edgev4.copyWith(right: AppDimen.w16),
                          child: Padding(
                            padding: AppDimen.edge8,
                            child: Text(option.answer),
                          ), */
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
