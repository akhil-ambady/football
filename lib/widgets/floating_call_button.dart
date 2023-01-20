import 'package:flutter/material.dart';
import 'package:football/module/home_module/controller/home_controller.dart';
import 'package:football/utils/const.dart';


class FloatingCallButton extends StatelessWidget {
  const FloatingCallButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Palette.red,
      onPressed: () => HomeController().callNumber(),
      tooltip: 'Make a call',
      child: const Icon(Icons.call),
    );
  }
}
