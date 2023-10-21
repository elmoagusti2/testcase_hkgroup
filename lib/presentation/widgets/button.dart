import 'package:flutter/material.dart';

class ButtonWidgets {
  static withRounded(
      {String? title,
      onPress,
      double? width,
      double? height,
      Color? backgroundColor,
      Color? borderColor,
      Color? foregroundColor}) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(
                  foregroundColor ?? Colors.white),
              backgroundColor: MaterialStateProperty.all<Color>(
                  backgroundColor ?? Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                side: BorderSide(color: borderColor ?? Colors.white),
                borderRadius: BorderRadius.circular(25),
              ))),
          onPressed: onPress,
          child: Text(title ?? '', style: const TextStyle(fontSize: 14))),
    );
  }
}
