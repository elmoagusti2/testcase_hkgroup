import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../commons/colors.dart';
import '../../commons/transition.dart';
import '../../presentation/quiz_page/bloc/quiz_bloc.dart';
import '../../presentation/quiz_page/widget/consumer_quiz.dart';
import '../../presentation/result_page/result_page.dart';

class QuizPage extends StatelessWidget {
  final String? topics;
  const QuizPage({super.key, this.topics});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => QuizBloc(),
        child: Quiz(
          topics: topics,
        ));
  }
}

class Quiz extends StatefulWidget {
  final String? topics;
  const Quiz({super.key, this.topics});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final _controller = PageController();
  late Timer _timer;
  @override
  void initState() {
    context.read<QuizBloc>().add(GetQuestion(topics: widget.topics));
    super.initState();
    startCountdown();
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  void startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final bloc = context.read<QuizBloc>();
      if (bloc.state.countDown > 0) {
        bloc.add(CountDown(count: bloc.state.countDown - 1));
      } else {
        bloc.add(ChoiceAnswerEmpty());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: ConstColors.main,
        appBar: AppBar(
          backgroundColor: ConstColors.main,
          elevation: 0.0,
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onTap: () {
              _controller.previousPage(
                  duration: const Duration(seconds: 1), curve: Curves.ease);
              BlocProvider.of<QuizBloc>(context).add(PreviousPage());
            },
          ),
          actions: [
            Container(
              padding: const EdgeInsets.only(right: 10),
              child: InkWell(
                child: const Text(
                  'EXIT',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(FadePageTransition(
                      page: ResultPage(
                    answer: context.read<QuizBloc>().state.answer,
                  )));
                },
              ),
            ),
          ],
        ),
        body: ConsumerQuiz(controller: _controller),
      ),
    );
  }
}
