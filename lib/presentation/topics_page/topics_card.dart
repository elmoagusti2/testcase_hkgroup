import 'package:flutter/material.dart';
import '../../commons/colors.dart';
import '../../commons/transition.dart';
import '../../presentation/quiz_page/quiz_page.dart';

class TopicsCard extends StatelessWidget {
  final String topics;
  const TopicsCard({
    super.key,
    required this.topics,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: ConstColors.navy400,
        child: ListTile(
          title: Text(
            topics,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: const Icon(
            Icons.play_arrow,
            color: Colors.lightBlueAccent,
          ),
        ),
      ),
      onTap: () => Navigator.of(context).push(FadePageTransition(
          page: QuizPage(
        topics: topics,
      ))),
    );
  }
}
