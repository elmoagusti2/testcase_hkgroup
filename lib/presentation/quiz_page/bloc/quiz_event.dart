part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();

  @override
  List<Object> get props => [];
}

class GetQuestion extends QuizEvent {
  final String? topics;

  const GetQuestion({this.topics});
}

class ChoiceAnswer extends QuizEvent {
  final String? answer;

  const ChoiceAnswer({required this.answer});
}

class ChangePage extends QuizEvent {
  final int? page;
  final Answer? answer;

  const ChangePage({required this.page, required this.answer});
}

class CountDown extends QuizEvent {
  final int? count;

  const CountDown({required this.count});
}

class PreviousPage extends QuizEvent {}

class QuizFinishEvent extends QuizEvent {}

class ChoiceAnswerEmpty extends QuizEvent {}
