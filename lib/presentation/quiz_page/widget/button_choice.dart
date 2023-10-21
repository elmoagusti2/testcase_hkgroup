import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../commons/colors.dart';
import '../../../presentation/quiz_page/bloc/quiz_bloc.dart';

class ButtonChoice extends StatelessWidget {
  const ButtonChoice({
    super.key,
    required this.item,
    required this.state,
  });

  final String item;
  final QuizState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 90 / 100,
      height: 40,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  state.temporaryAnswer.contains(item)
                      ? ConstColors.aqua
                      : Colors.white),
              foregroundColor:
                  MaterialStateProperty.all<Color>(ConstColors.main),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ))),
          onPressed: () =>
              context.read<QuizBloc>().add(ChoiceAnswer(answer: item)),
          child: Text(item,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2)),
    );
  }
}
