import 'package:equatable/equatable.dart';

class Answer extends Equatable {
  final String? question;
  final bool? correct;
  final List<String>? answerCorrect;
  final List<String>? answer;

  const Answer({
    this.question,
    this.correct,
    this.answerCorrect,
    this.answer,
  });

  factory Answer.fromJson(Map<String, dynamic> json) => Answer(
        question: json['question'] as String?,
        correct: json['correct'] as bool?,
        answerCorrect: json['answer_correct'] as List<String>?,
        answer: json['answer'] as List<String>?,
      );

  Map<String, dynamic> toJson() => {
        'question': question,
        'correct': correct,
        'answer_correct': answerCorrect,
        'answer': answer,
      };

  Answer copyWith({
    String? question,
    bool? correct,
    List<String>? answerCorrect,
    List<String>? answer,
  }) {
    return Answer(
      question: question ?? this.question,
      correct: correct ?? this.correct,
      answerCorrect: answerCorrect ?? this.answerCorrect,
      answer: answer ?? this.answer,
    );
  }

  @override
  List<Object?> get props => [question, correct, answerCorrect, answer];
}
