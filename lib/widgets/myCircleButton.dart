import 'package:flutter/material.dart';

class MyCircleButton extends StatelessWidget {
  const MyCircleButton({super.key, required this.image, required this.onPressed});
  final String image;
  final Function()?  onPressed;
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
                  onPressed: onPressed,
                  shape: CircleBorder(eccentricity: 0.1),

                  child: Image.asset(
                    image,
                    width: 22,
                  ),
                );
  }
}