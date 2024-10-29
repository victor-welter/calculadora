// lib/widgets/cs_display.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/calculadora_controller.dart';

class CsDisplay extends StatelessWidget {
  const CsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(20).copyWith(bottom: 0),
      color: Colors.grey[900],
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(15),
        child: Consumer<CalculatorController>(
          builder: (context, controller, child) {
            return Text(
              controller.displayValue,
              style: Theme.of(context).textTheme.displayLarge,
            );
          },
        ),
      ),
    );
  }
}
