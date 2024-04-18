import 'package:flutter/material.dart';

class Cart_Product extends StatelessWidget {
  const Cart_Product({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffD9D9D9),width: 2),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Image.asset("images/cart.png")),
                          SizedBox(
                            width: 25,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Mint Seedling"),
                              SizedBox(
                                height: 20,
                              ),
                              Text("LE.20")
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: Image.asset("images/cancel.png")),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 70,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Color(0xffB7D7BE))),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
      
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          
                                        },
                                        child: Icon(
                                          Icons.remove,
                                          color: Color(0xff1A7431),
                                          size: 15,
                                        )),
      
                                    SizedBox(width: 2),
                                    Text(
                                      '',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    // SizedBox(width: 1),
                                    InkWell(
                                        onTap: () {
                                          
                                        },
                                        child: Icon(
                                          Icons.add,
                                          color: Color(0xff1A7431),
                                          size: 15,
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
    );
  }
}