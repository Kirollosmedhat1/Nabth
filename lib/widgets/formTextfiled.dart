// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors

import 'package:flutter/material.dart';

class MyTextFormField2 extends StatelessWidget {
  const MyTextFormField2(
      {super.key,
      required this.hintText,
      required this.mycontroller,
      this.validator});
  final String hintText;
  final TextEditingController mycontroller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 342,
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        validator: validator,
        controller: mycontroller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                  color: Color(0xffC1D9C7), width: 1.5),
            ),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            fillColor: Colors.white,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Color(0xff928FA6),
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}
