// ignore_for_file: prefer_const_constructors

import 'package:application5/controller/cont/onboardingCont.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({super.key});

  final obcontroller = Get.put(OnBoardingCont());

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      // appBar: AppBar(toolbarHeight: 0,),
      backgroundColor: Colors.white,
      body: Column(
        children: [
        
          
              Container(

                child: LiquidSwipe(
                  enableLoop: false,
                  pages: obcontroller.pages,
                  
                  liquidController: obcontroller.controller,
                  onPageChangeCallback: obcontroller.onPageChangeCallback,
                ),
              ),
           
            
          Center(
            child: GetBuilder(
              init:OnBoardingCont(),
              builder: (_) {
            return  AnimatedSmoothIndicator(
                activeIndex: obcontroller.currentPage,
                count: 3,
                effect: SlideEffect(
                    radius: 50,
                    dotWidth: 10,
                    dotHeight: 10,
                    activeDotColor: Color.fromRGBO(26, 116, 49, 1)));}),
          ),
            
          Container(
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 90),
              // width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton(
                          
                          onPressed: () => obcontroller.skip(),
                          child:  Text("skip ",
                          style: GoogleFonts.workSans(textStyle: 
                           TextStyle(color: Color.fromRGBO(30, 155, 61, 1),
                           fontSize: 18,
                           fontWeight: FontWeight.w500,
                           height: 1,
                           letterSpacing: -0.24,
                           )),
                         ) ),
                      ),
                    ),
                    // Spacer(flex: 1),
                    Expanded(
                        child: Align(
                        
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              
                              onPressed: () => obcontroller.next(),
                              child:  Text("Next ",
                                  style: GoogleFonts.workSans(textStyle:
                                  TextStyle(color: Color.fromRGBO(26, 116, 49, 1),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                  height: 1,
                                  )),
                    )))),
                  ]),
            
          ),
        ],
      ),
    );
  }
}