import 'package:flutter/material.dart';
import '../../../commons/colors.dart';
import '../../../commons/common_util.dart';
import '../../../models/question.dart';
import '../../../presentation/quiz_page/bloc/quiz_bloc.dart';
import '../../../presentation/quiz_page/widget/button_choice.dart';

class CardQuestion extends StatelessWidget {
  const CardQuestion({
    super.key,
    required this.question,
    required this.state,
  });

  final Question question;
  final QuizState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Text(
                  question.title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                !CommonUtil.falsyChecker(question.imgPath)
                    ? Image.network(
                        '${question.imgPath}',
                        width: 500,
                        height: 200,
                        fit: BoxFit.fill,
                      )
                    : Container(),
                const SizedBox(height: 18),
                question.multipleAnswer == true
                    ? Row(
                        children: [
                          Icon(
                            Icons.checklist,
                            color: ConstColors.yellow400,
                          ),
                          Text("Multiple Choices",
                              style: TextStyle(
                                  color: ConstColors.yellow400, fontSize: 16))
                        ],
                      )
                    : Container(),
              ],
            )),
        const SizedBox(height: 24),
        for (var item in question.choicesAnswer!)
          ButtonChoice(
            item: item,
            state: state,
          ),
      ],
    );
  }
}
