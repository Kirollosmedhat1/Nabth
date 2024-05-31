import 'package:flutter/material.dart';

class Noplant extends StatefulWidget {
  const Noplant({super.key});

  @override
  State<Noplant> createState() => _NoplantState();
}

class _NoplantState extends State<Noplant> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      child: Center(
          child: Column(
        children: [
          SizedBox(
            height: 80,
          ),
          Image.asset("images/IconNOplant.png"),
        ],
      )),
    );
  }
}
