import 'package:flutter/cupertino.dart';
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
            backgroundColor: Color(0xffCAEDCF),
            child: ColorFiltered(
              colorFilter: ColorFilter.mode(
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
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xff1E9B3D),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 5),
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("images/arrow.png"))),
          ),
        ],
      ),
    );
  }
}
