import 'package:flutter/material.dart';

class custom_cart extends StatefulWidget {
  const custom_cart({super.key});

  @override
  State<custom_cart> createState() => _custom_cartState();
}

class _custom_cartState extends State<custom_cart> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
