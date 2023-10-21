import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../../../commons/colors.dart';
import '../../../commons/counting.dart';
import '../../../models/answer.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    super.key,
    required this.answer,
  });

  final List<Answer> answer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(ConstColors.aqua),
              foregroundColor:
                  MaterialStateProperty.all<Color>(ConstColors.aqua),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: ConstColors.aqua)))),
          onPressed: () async => await Share.share(
              'I got a score of ${Count.countCorrectAnswers(answer)} out of ${answer.length} in taking the quiz apps by Hasta Kencana Group. Download here to get started https://hastakencanajaya.co.id/'),
          child: const Text("Share Your Score",
              style: TextStyle(fontSize: 14, color: Colors.white))),
    );
  }
}
