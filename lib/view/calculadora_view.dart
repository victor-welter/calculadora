// lib/pages/calc_page.dart
import 'package:flutter/material.dart';
import '../controller/calculadora_controller.dart';
import '../widgets/cs_display.dart';
import '../widgets/cs_keyboard.dart';
import 'package:provider/provider.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CalculatorController(),
      child: const Material(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: CsDisplay(),
            ),
            Expanded(
              flex: 3,
              child: CsKeyboard(),
            ),
          ],
        ),
      ),
    );
  }
}
