part of 'quiz_bloc.dart';

class QuizState extends Equatable {
  final RequestState requestState;
  final List<Question> question;
  final List<Answer> answer;
  final List<String> temporaryAnswer;
  final int page;
  final int countDown;
  const QuizState(
      {required this.requestState,
      required this.question,
      required this.answer,
      required this.page,
      required this.temporaryAnswer,
      required this.countDown});

  QuizState copyWith({
    RequestState? requestState,
    List<Question>? question,
    List<Answer>? answer,
    int? page,
    List<String>? temporaryAnswer,
    int? countDown,
  }) {
    return QuizState(
      requestState: requestState ?? this.requestState,
      answer: answer ?? this.answer,
      question: question ?? this.question,
      temporaryAnswer: temporaryAnswer ?? this.temporaryAnswer,
      page: page ?? this.page,
      countDown: countDown ?? this.countDown,
    );
  }

  @override
  List<Object> get props =>
      [requestState, question, answer, temporaryAnswer, page, countDown];

  @override
  bool get stringify => true;
}

class QuizInitial extends QuizState {
  QuizInitial()
      : super(
            requestState: RequestState.empty,
            answer: [],
            question: [],
            temporaryAnswer: [],
            page: 0,
            countDown: 30);
}

class QuizFinish extends QuizState {
  const QuizFinish(
      {required super.requestState,
      required super.question,
      required super.answer,
      required super.page,
      required super.temporaryAnswer,
      required super.countDown});

  @override
  List<Object> get props =>
      [requestState, question, answer, temporaryAnswer, page, countDown];

  @override
  bool get stringify => true;
}
