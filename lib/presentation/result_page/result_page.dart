import 'package:flutter/material.dart';
import '../../commons/colors.dart';
import '../../models/answer.dart';
import '../../presentation/result_page/widgets/answer_result.dart';
import '../../presentation/result_page/widgets/progress_score.dart';
import '../../presentation/result_page/widgets/share_button.dart';

class ResultPage extends StatelessWidget {
  final List<Answer> answer;
  const ResultPage({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstColors.main,
      appBar: AppBar(
        backgroundColor: ConstColors.main,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Your Score', style: TextStyle(color: Colors.white)),
      ),
      body: SafeArea(
          child: Column(
        children: [
          const SizedBox(height: 16),
          ProgressScore(answer: answer),
          const SizedBox(height: 18),
          ShareButton(answer: answer),
          const SizedBox(height: 12),
          const Text('Your Report',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
          const SizedBox(height: 12),
          AnswerResult(answer: answer)
        ],
      )),
    );
  }
}
