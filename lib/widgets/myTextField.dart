import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({super.key, required this.hintText, required this.mycontroller, this.validator});
  final String hintText;
   final TextEditingController mycontroller;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      child: TextFormField(
        validator: validator,
      controller: mycontroller,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Color(0xffB5D5BC), width: 1.5),
            ),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            fillColor: Color(0xffEEF9F0),
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 17,
              color: Color(0xff928FA6),
              fontWeight: FontWeight.w400,
            )),
      ),
    );
  }
}
