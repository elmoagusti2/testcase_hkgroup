import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../commons/colors.dart';
import '../../../commons/common_util.dart';
import '../../../commons/enum.dart';
import '../../../commons/transition.dart';
import '../../../models/answer.dart';
import '../../../models/question.dart';
import '../../../presentation/quiz_page/bloc/quiz_bloc.dart';
import '../../../presentation/quiz_page/widget/card_question.dart';
import '../../../presentation/result_page/result_page.dart';

class ConsumerQuiz extends StatelessWidget {
  const ConsumerQuiz({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuizBloc, QuizState>(
      listener: (context, state) {
        if (!CommonUtil.falsyChecker(state.question)) {
          if (state.question[state.page].multipleAnswer == false &&
              state.temporaryAnswer.isNotEmpty &&
              state.question.length != (state.page + 1)) {
            _controller.nextPage(
                duration: const Duration(seconds: 1), curve: Curves.ease);
          }
          if (state.question[state.page].multipleAnswer == true &&
              state.temporaryAnswer.length >= 2 &&
              state.question.length != (state.page + 1)) {
            _controller.nextPage(
                duration: const Duration(seconds: 1), curve: Curves.ease);
          }
          if (state.question.length == (state.page + 1)) {
            if (state.question[state.page].multipleAnswer == false &&
                state.temporaryAnswer.isNotEmpty) {
              Question quest = state.question[state.page];
              context.read<QuizBloc>().add(ChangePage(
                  page: state.page,
                  answer: Answer(
                      answerCorrect: quest.correctAnswer,
                      question: quest.title,
                      answer: state.temporaryAnswer)));
              context.read<QuizBloc>().add(QuizFinishEvent());
            }
            if (state.question[state.page].multipleAnswer == true &&
                state.temporaryAnswer.length == 2) {
              Question quest = state.question[state.page];
              context.read<QuizBloc>().add(ChangePage(
                  page: state.page,
                  answer: Answer(
                      answerCorrect: quest.correctAnswer,
                      question: quest.title,
                      answer: state.temporaryAnswer)));
              context.read<QuizBloc>().add(QuizFinishEvent());
            }
          }
          if (state is QuizFinish) {
            Navigator.pop(context);
            Navigator.of(context).push(FadePageTransition(
                page: ResultPage(
              answer: context.read<QuizBloc>().state.answer,
            )));
          }
        }
        if (state.requestState == RequestState.error) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        final List<Question> question = state.question;
        return state.requestState == RequestState.success
            ? Column(
                children: [
                  LinearPercentIndicator(
                    width: MediaQuery.of(context).size.width,
                    animation: true,
                    padding: const EdgeInsets.all(0),
                    lineHeight: 10.0,
                    percent: (state.page + 1) / question.length,
                    animateFromLastPercent: true,
                    progressColor: ConstColors.yellow400,
                    backgroundColor: ConstColors.loadingBackground,
                  ),
                  const SizedBox(height: 16),
                  Flexible(
                    child: PageView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _controller,
                      onPageChanged: (value) {
                        if (value > state.page) {
                          Question quest = state.question[state.page];
                          context.read<QuizBloc>().add(ChangePage(
                              page: value,
                              answer: Answer(
                                  answerCorrect: quest.correctAnswer,
                                  question: quest.title,
                                  answer: state.temporaryAnswer)));
                        }
                      },
                      itemCount: question.length,
                      itemBuilder: (context, index) => CardQuestion(
                        question: question[index],
                        state: state,
                      ),
                    ),
                  ),
                ],
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Colors.white,
              ));
      },
    );
  }
}
