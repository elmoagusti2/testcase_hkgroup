import 'package:flutter/material.dart';

class FadePageTransition extends PageRouteBuilder {
  FadePageTransition({
    required Widget page,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var fadeAnimation = Tween(begin: 0.0, end: 1.0).animate(animation);
            return FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
}

class RipplePageTransition extends PageRouteBuilder {
  RipplePageTransition({
    required Widget page,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeInOut));
            var offsetAnimation = animation.drive(tween);
            return SlideTransition(
              position: offsetAnimation,
              child: ScaleTransition(
                scale: animation,
                child: child,
              ),
            );
          },
        );
}
