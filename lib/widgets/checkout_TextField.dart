import 'package:flutter/material.dart';

class Checkout_Textfield extends StatelessWidget {
  // final String hintText;
  final String hintText;
  Checkout_Textfield({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return
        TextFormField(
            cursorColor: Colors.black,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: hintText,
              hintStyle: const TextStyle(
                  color: Colors.grey),
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
