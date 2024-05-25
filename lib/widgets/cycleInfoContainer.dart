import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CycleInfoContainer extends StatelessWidget {
  const CycleInfoContainer(
      {super.key, required this.title, required this.info, });
  final String title;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffF2F2F2)),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "   $title",
            style: const TextStyle(
                color: Color(0xff4F795B),
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: "WorkSans"),
          ),
          Text(
            info,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: "WorkSans"),
          ),
        ],
      ),
    );
  }
}
