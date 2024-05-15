import 'package:flutter/material.dart';

class CycleCatWidget extends StatelessWidget {
  const CycleCatWidget({super.key, required this.image, required this.title, required this.onTap});
  final String image;
  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        width: 200,
        height: 250,
        decoration: BoxDecoration(
          color: Color(0xffF1FCF3),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xffB7D7BE), width: 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 200,
              height: 180,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image:
                    DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
              child: Text(title,
              style: TextStyle(
                        color: Color(0xff4F795B),
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
