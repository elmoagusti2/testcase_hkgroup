import 'package:flutter/material.dart';
import '../../../commons/colors.dart';
import '../../../models/answer.dart';

class AnswerResult extends StatelessWidget {
  const AnswerResult({
    super.key,
    required this.answer,
  });

  final List<Answer> answer;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: answer.length,
        itemBuilder: (context, index) => AnswerList(answer: answer[index]),
      ),
    );
  }
}

class AnswerList extends StatelessWidget {
  const AnswerList({
    super.key,
    required this.answer,
  });

  final Answer answer;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${answer.question}",
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          !answer.correct!
              ? Padding(
                  padding: const EdgeInsets.only(right: 6.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.close,
                        color: ConstColors.redCustom,
                      ),
                      Text(answer.answer?.map((e) => e).join(', ') ?? "",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16))
                    ],
                  ),
                )
              : Container(),
          Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Row(
              children: [
                Icon(
                  Icons.check,
                  color: ConstColors.greenCustom,
                ),
                Text(answer.answerCorrect?.map((e) => e).join(', ') ?? "",
                    style: const TextStyle(color: Colors.white, fontSize: 16))
              ],
            ),
          )
        ],
      ),
    );
  }
}
