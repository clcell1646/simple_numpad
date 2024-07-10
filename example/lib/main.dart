import 'package:flutter/material.dart';
import 'package:simple_numpad/simple_numpad.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Numpad Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: SimpleNumpadExample(),
        ),
      ),
    );
  }
}

class SimpleNumpadExample extends StatefulWidget {
  const SimpleNumpadExample({super.key});

  @override
  State<StatefulWidget> createState() => SimpleNumpadExampleState();
}

class SimpleNumpadExampleState extends State<SimpleNumpadExample> {
  String text = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 27,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 45),
        SimpleNumpad(
          buttonWidth: 100,
          buttonHeight: 80,
          gridSpacing: 0,
          buttonBorderRadius: 8,
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
          useBackspace: true,
          removeBlankButton: false,
          optionText: 'clear',
          onPressed: onPressed,
        ),
      ],
    );
  }

  void onPressed(String str) {
    switch (str) {
      case 'BACKSPACE':
        // This case is accessible when you have set "useBackspace: true".
        removeLast();
        break;
      case 'clear':
        // This string is what you have injected into "optionText".
        removeAll();
        break;
      default:
        // '1', '2', '3', '4', '5', '6', '7', '8', '9', '0'
        append(str);
        break;
    }
  }

  void removeLast() {
    if (text.isEmpty) return;
    setState(() {
      text = text.substring(0, text.length - 1);
    });
  }

  void removeAll() {
    setState(() {
      text = '';
    });
  }

  void append(String value) {
    setState(() {
      text = text + value;
    });
  }
}
