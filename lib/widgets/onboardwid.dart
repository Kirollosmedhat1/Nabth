
// ignore_for_file: prefer_const_constructors

import 'package:application5/model/model_onboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoradingPageWidget extends StatelessWidget {
  const OnBoradingPageWidget({
    super.key,
    required this.model,
  });

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {
    //  final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(20),
      color: model.bgColor,
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image(
            image: AssetImage(model.image),
            height: model.height 
          ),
          
              Text(model.title,
                  style:  GoogleFonts.workSans(textStyle: TextStyle(
                    
                    fontSize: 30.8,
                    fontWeight: FontWeight.w600

                  ))
              
                   
                  ),
                  SizedBox(height: 30,),
              Text(
                model.subTitle,
                style:  GoogleFonts.workSans(textStyle :
                TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  // letterSpacing: -0.24
                  
                )),
                textAlign: TextAlign.center,
              ),
              //  SizedBox(
              //   height: 50.0,
              // )
           
        ],
      ),
    );
  }
}