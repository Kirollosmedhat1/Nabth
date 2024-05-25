import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key, required this.widget, this.padding});
  
  final Widget widget;
  final EdgeInsetsGeometry? padding; 
  @override
  Widget build(BuildContext context) {
    return  Container(
                          height: 180,
                          padding: padding,
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: const Color(0xffEDEDED),
                              ),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: Offset(0, 0),
                                    color: Colors.black26)
                              ]),
                              child: widget,
                        );
  }
}