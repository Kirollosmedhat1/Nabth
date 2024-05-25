import 'package:flutter/material.dart';

class myTextFromFiled extends StatelessWidget {
  // final String hintText;
  final String hintText;
  final String? Function(String?)? validator;
  

  const myTextFromFiled({
    super.key,
    required this.hintText,
    this.validator,
    
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      
        validator: validator,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.w500,fontFamily: "WorkSans"),
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xffB7D7BE))),
        ));
  }
}
