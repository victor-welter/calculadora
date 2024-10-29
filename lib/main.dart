import 'package:calculadora/view/calculadora_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const CalculatorView(),
    );
  }
}
