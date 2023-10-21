import '../models/answer.dart';

class Count {
  static countCorrectAnswers(List<Answer> answerList) {
    return answerList.where((answer) => answer.correct!).length;
  }
}
