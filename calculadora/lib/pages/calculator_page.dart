import 'package:calculadora/controllers/calculator_controller.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildDisplay(text: _controller.result),
          Divider(color: Colors.white),
          _buildKeyboard(),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      title: Text('Calculadora', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildDisplay({String text}) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        child: Text(
          text ?? '0',
          textAlign: TextAlign.end,
          style: TextStyle(color: Colors.white, fontSize: 52),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    final height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.blue,
      height: height * 0.65 > 500.0 ? 500 : height * 0.65,
      child: Column(
        children: [
          _buildKeyboardLine1(),
          _buildKeyboardLine2(),
          _buildKeyboardLine3(),
          _buildKeyboardLine4(),
          _buildKeyboardLine5(),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine1() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: 'AC', color: Colors.deepOrange),
          _buildButton(label: 'DEL', color: Colors.deepOrange),
          _buildButton(label: '%', color: Colors.deepOrange),
          _buildButton(label: '/', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine2() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '7'),
          _buildButton(label: '8'),
          _buildButton(label: '9'),
          _buildButton(label: 'x', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine3() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '4'),
          _buildButton(label: '5'),
          _buildButton(label: '6'),
          _buildButton(label: '-', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine4() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '1'),
          _buildButton(label: '2'),
          _buildButton(label: '3'),
          _buildButton(label: '+', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildKeyboardLine5() {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildButton(label: '0', flex: 2),
          _buildButton(label: ','),
          _buildButton(label: '=', color: Colors.deepOrange),
        ],
      ),
    );
  }

  Widget _buildButton(
      {String label, int flex = 1, Color color = Colors.white}) {
    return Expanded(
      flex: flex,
      // ignore: deprecated_member_use
      child: RaisedButton(
        child: Text(
          label,
          style: TextStyle(
            fontSize: 24,
            color: color,
          ),
        ),
        color: Colors.black,
        onPressed: () => _calculatorLogic(label),
      ),
    );
  }

  _calculatorLogic(String label) {
    setState(() {
      _controller.applyCommand(label);
    });
  }
}
