// lib/widgets/cs_keyboard.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/calculadora_controller.dart';

class CsKeyboard extends StatelessWidget {
  const CsKeyboard({super.key});

  void _onPressed(BuildContext context, String value) {
    final controller =
        Provider.of<CalculatorController>(context, listen: false);

    if ('CCE'.contains(value)) {
      controller.onClear();
    } else if (value == '=') {
      controller.onEquals();
    } else if (value == '<-') {
      controller.onRemove();
    } else if (value == '%') {
      controller.onPercentage();
    } else if ('+-X/'.contains(value)) {
      controller.onOperation(value);
    } else {
      controller.onDigit(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 4,
      children: [
        Button('<-', (valor) => _onPressed(context, valor), Colors.grey),
        Button('C', (valor) => _onPressed(context, valor), Colors.grey),
        Button('CE', (valor) => _onPressed(context, valor), Colors.grey),
        Button('%', (valor) => _onPressed(context, valor), Colors.orange[700]),
        Button('7', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('8', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('9', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('X', (valor) => _onPressed(context, valor), Colors.orange[700]),
        Button('4', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('5', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('6', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('-', (valor) => _onPressed(context, valor), Colors.orange[700]),
        Button('1', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('2', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('3', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('+', (valor) => _onPressed(context, valor), Colors.orange[700]),
        Button('', (valor) => {}, Colors.grey[800]),
        Button('0', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('.', (valor) => _onPressed(context, valor), Colors.grey[800]),
        Button('=', (valor) => _onPressed(context, valor), Colors.orange[700]),
      ],
    );
  }
}

class Button extends StatelessWidget {
  const Button(this.valor, this.onTap, this.color, {super.key});

  final String valor;
  final void Function(String value)? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(0),
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Colors.black),
      ),
      child: InkWell(
        onTap: onTap == null ? null : () => onTap!(valor),
        splashColor: Colors.grey[400]?.withOpacity(0.5),
        hoverColor: Colors.grey[400]?.withOpacity(0.5),
        focusColor: Colors.grey[400]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(10),
        child: Center(
          child: Text(
            valor,
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ),
    );
  }
}
