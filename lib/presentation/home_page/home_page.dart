import 'package:flutter/material.dart';
import '../../commons/colors.dart';
import '../../commons/transition.dart';
import '../../presentation/home_page/widget/headers.dart';
import '../../presentation/home_page/widget/share_and_rate.dart';
import '../../presentation/quiz_page/quiz_page.dart';
import '../../presentation/topics_page/topics_page.dart';
import '../../presentation/widgets/button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ConstColors.main,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 96),
              const Headers(),
              ButtonWidgets.withRounded(
                  title: 'PLAY',
                  onPress: () => Navigator.of(context)
                      .push(RipplePageTransition(page: const QuizPage())),
                  width: 300,
                  height: 50,
                  backgroundColor: ConstColors.aqua,
                  borderColor: ConstColors.aqua,
                  foregroundColor: Colors.white),
              const SizedBox(
                height: 12,
              ),
              ButtonWidgets.withRounded(
                  title: 'TOPICS',
                  onPress: () => Navigator.of(context)
                      .push(RipplePageTransition(page: const TopicsPage())),
                  width: 300,
                  height: 50,
                  backgroundColor: ConstColors.main,
                  borderColor: ConstColors.aqua,
                  foregroundColor: ConstColors.aqua),
              const SizedBox(height: 24),
              const ShareAndRate()
            ],
          ),
        ));
  }
}
