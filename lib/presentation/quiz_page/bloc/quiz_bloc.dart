import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../commons/common_util.dart';
import '../../../commons/enum.dart';
import '../../../models/answer.dart';
import '../../../models/question.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  final fs = FirebaseFirestore.instance;

  QuizBloc() : super(QuizInitial()) {
    on<QuizEvent>((event, emit) {});
    on(_getQuestion);
    on(_choiceAnswer);
    on(_choiceAnswerEmpty);
    on(_changePage);
    on(_prevPage);
    on(_finishQuiz);
    on(_countDown);
  }

  _getQuestion(GetQuestion event, emit) async {
    emit(const QuizState(
        requestState: RequestState.loading,
        question: [],
        answer: [],
        temporaryAnswer: [],
        page: 0,
        countDown: 30));
    try {
      await fs
          .collection('question')
          .where('topics',
              isEqualTo:
                  !CommonUtil.falsyChecker(event.topics) ? event.topics : null)
          .get()
          .then((QuerySnapshot querySnapshot) {
        List<Question> data = [];
        if (querySnapshot.docs.isNotEmpty) {
          for (var item in querySnapshot.docs) {
            data.add(Question.fromJson(item.data() as Map<String, dynamic>));
          }
          data.shuffle();
          emit(state.copyWith(
              requestState: RequestState.success, question: data));
        }
        if (querySnapshot.docs.isEmpty) {
          emit(state.copyWith(requestState: RequestState.error, question: []));
        }
      });
    } catch (e) {
      emit(state.copyWith(requestState: RequestState.error));
    }
  }

  _choiceAnswer(ChoiceAnswer event, emit) {
    List<String> list = List.from(state.temporaryAnswer);

    if (CommonUtil.falsyChecker(state.temporaryAnswer)) {
      list.add(event.answer!);
      emit(state.copyWith(temporaryAnswer: list));
    }
    if (!list.contains(event.answer)) {
      list.add(event.answer!);
      emit(state.copyWith(temporaryAnswer: list));
    }
  }

  _choiceAnswerEmpty(ChoiceAnswerEmpty event, emit) {
    emit(state.copyWith(temporaryAnswer: ['empty', 'over 30sec']));
  }

  _changePage(ChangePage event, emit) {
    List<Answer> list = List.from(state.answer);
    Answer data = event.answer!.copyWith(
        correct:
            compareLists(event.answer?.answerCorrect, event.answer?.answer));
    list.add(data);
    emit(state.copyWith(
        page: event.page, temporaryAnswer: [], answer: list, countDown: 30));
  }

  _prevPage(PreviousPage event, emit) {
    List<Answer> list = List.from(state.answer);
    list.removeLast();
    emit(state.copyWith(
        answer: list,
        page: state.page - 1,
        temporaryAnswer: [],
        countDown: 30));
  }

  _finishQuiz(QuizFinishEvent event, emit) {
    emit(QuizFinish(
        requestState: state.requestState,
        question: state.question,
        answer: state.answer,
        page: state.page,
        temporaryAnswer: state.temporaryAnswer,
        countDown: state.countDown));
  }

  _countDown(CountDown event, emit) {
    emit(state.copyWith(countDown: event.count));
  }
}

bool compareLists(correctAnswer, answer) {
  if (correctAnswer.length != answer.length) {
    return false;
  }
  correctAnswer.sort();
  answer.sort();
  return const ListEquality().equals(correctAnswer, answer);
}
