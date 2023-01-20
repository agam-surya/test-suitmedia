import 'package:flutter/material.dart';

ElevatedButton customButton(
    {required Function() onPressed, required String text}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          primary: const Color(0xff2B637B),
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
              side: BorderSide.none) // NEW
          ),
      child: Text(text));
}
