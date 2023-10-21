import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Headers extends StatelessWidget {
  const Headers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Column(
        children: [
          LottieBuilder.asset('assets/lottie/light.json',
              width: 200, height: 150),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'Flutter Quiz App',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, color: Colors.white),
          ),
          const SizedBox(
            height: 6,
          ),
          const Text(
            'Learn ● Take Quiz ● Repeat',
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white),
          )
        ],
      ),
    );
  }
}
