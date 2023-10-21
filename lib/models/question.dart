import 'package:equatable/equatable.dart';

class Question extends Equatable {
  final String? topics;
  final String? title;
  final String? imgPath;
  final bool? multipleAnswer;
  final List<String>? choicesAnswer;
  final List<String>? correctAnswer;

  const Question({
    this.topics,
    this.title,
    this.imgPath,
    this.multipleAnswer,
    this.choicesAnswer,
    this.correctAnswer,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        topics: json['topics'] as String?,
        title: json['title'] as String?,
        imgPath: json['img_path'] as String?,
        multipleAnswer: json['multiple_answer'] as bool?,
        choicesAnswer: json['choices_answer'].cast<String>(),
        correctAnswer: json['correct_answer'].cast<String>(),
      );

  Map<String, dynamic> toJson() => {
        'topics': topics,
        'title': title,
        'img_path': imgPath,
        'multiple_answer': multipleAnswer,
        'choices_answer': choicesAnswer,
        'correct_answer': correctAnswer,
      };

  Question copyWith({
    String? topics,
    String? title,
    String? imgPath,
    bool? multipleAnswer,
    List<String>? choicesAnswer,
    List<String>? correctAnswer,
  }) {
    return Question(
      topics: topics ?? this.topics,
      title: title ?? this.title,
      imgPath: imgPath ?? this.imgPath,
      multipleAnswer: multipleAnswer ?? this.multipleAnswer,
      choicesAnswer: choicesAnswer ?? this.choicesAnswer,
      correctAnswer: correctAnswer ?? this.correctAnswer,
    );
  }

  @override
  List<Object?> get props {
    return [
      topics,
      title,
      imgPath,
      multipleAnswer,
      choicesAnswer,
      correctAnswer,
    ];
  }
}
