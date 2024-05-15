import 'package:flutter/material.dart';

class MyACCrow extends StatelessWidget {
  const MyACCrow(
      {super.key,
      required this.iconImage,
      required this.title,
      this.onPressed});
  final String iconImage;
  final String title;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: const Color(0xffCAEDCF),
            child: ColorFiltered(
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.modulate,
              ),
              child: Image.asset(
                iconImage,
                width: 30,
                height: 30,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xff1E9B3D),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            height: 30,
            width: 30,
            decoration: const BoxDecoration(
                image: const DecorationImage(image: AssetImage("images/arrow.png"))),
          ),
        ],
      ),
    );
  }
}
