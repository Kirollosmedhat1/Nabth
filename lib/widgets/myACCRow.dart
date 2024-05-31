import 'package:flutter/material.dart';

class MyACCrow extends StatelessWidget {
  const MyACCrow(
      {super.key,
      required this.iconImage,
      required this.title,
      this.onTap});
  final String iconImage;
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 27,
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
                color: Color(0xff1A7431),
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 5),
          const Icon(Icons.arrow_forward_ios,color: Color(0xff1E9B3D),size: 25,),
        ],
      ),
    );
  }
}
