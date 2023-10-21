import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../commons/colors.dart';
import '../../../commons/counting.dart';
import '../../../models/answer.dart';

class ProgressScore extends StatelessWidget {
  const ProgressScore({
    super.key,
    required this.answer,
  });

  final List<Answer> answer;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 80.0,
        animation: true,
        animationDuration: 1200,
        lineWidth: 11.0,
        percent: 1.0 -
            (Count.countCorrectAnswers(answer) /
                double.parse(answer.length.toString())),
        animateFromLastPercent: true,
        center: Text(
          '${Count.countCorrectAnswers(answer)} / ${answer.length}',
          style: const TextStyle(fontSize: 20.0, color: Colors.white),
        ),
        circularStrokeCap: CircularStrokeCap.butt,
        backgroundColor: ConstColors.greenCustom,
        progressColor: ConstColors.redCustom,
      ),
    );
  }
}
