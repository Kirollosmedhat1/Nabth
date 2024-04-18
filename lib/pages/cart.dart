import 'package:application5/widgets/mycart_part1.dart';
import 'package:application5/widgets/payment_summry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Cart_Page extends StatefulWidget {
  @override
  _Cart_PagePageState createState() => _Cart_PagePageState();
}

class _Cart_PagePageState extends State<Cart_Page> {
  int _selectedIndex = 0;
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1FCF3),
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCF3),
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "images/back.png",
                height: 20,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Cart",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(
                    0xff1B602D,
                  ),
                  fontSize: 25),
            )
          ],
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "4 Items in your cart",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff184F27)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Add more",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff184F27)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      ]),
                  MyCartPart1(
                    text: "Mint Seedling",
                    number: "LE.20",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyCartPart1(
                    text: "Mint Seedling",
                    number: "LE.20",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyCartPart1(
                    text: "Mint Seedling",
                    number: "LE.20",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MyCartPart1(
                    text: "Mint Seedling",
                    number: "LE.20",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Payment Summary",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xff1B602D)),
                      ),
                    ],
                  ),
                  payment_summary(
                    text: "Order Total",
                    number: "150",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  payment_summary(
                    text: "Order Total",
                    number: "150",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  payment_summary(
                    text: "Order Total",
                    number: "150",
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  payment_summary(
                    text: "Order Total",
                    number: "150",
                  ),
                  Divider(
                    color: Color(0xffB7D7BE),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text("  Total",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff184F27))),
                          ),
                          Container(
                            child: Text(
                              "LE 150.40",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff184F27)),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Color(0xFF1B602D),
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 100,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("continue",
                            style: TextStyle(fontSize: 15)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// Container(
//             padding: EdgeInsets.symmetric(horizontal: 30),
//             child: Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "4 Items in your cart",
//                       style: TextStyle(fontSize: 15),
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: [
//                         IconButton(onPressed: () {}, icon: Icon(Icons.add)),
//                         SizedBox(
//                           height: 15,
//                         ),
//                         Text("Add more")
//                       ],
//                     ),
//                   ],
//                 ),

//                 SizedBox(
//                   height: 5,
//                 ),
//                 MyCartPart1(
//                   text: "zeyad",
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset("images/image 65.png"),
//                         SizedBox(
//                           width: 25,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Mint Seedling"),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text("LE.20")
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               "images/x.svg",
//                               height: 15,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   onPressed: _decrementCounter,
//                                   icon: Icon(Icons.remove),
//                                   iconSize: 15,
//                                 ),
//                                 SizedBox(width: 2),
//                                 Text(
//                                   '$_counter',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 // SizedBox(width: 1),
//                                 IconButton(
//                                   onPressed: _incrementCounter,
//                                   icon: Icon(Icons.add),
//                                   iconSize: 15,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset("images/image 65.png"),
//                         SizedBox(
//                           width: 25,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Mint Seedling"),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text("LE.20")
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               "images/x.svg",
//                               height: 15,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   onPressed: _decrementCounter,
//                                   icon: Icon(Icons.remove),
//                                   iconSize: 15,
//                                 ),
//                                 SizedBox(width: 2),
//                                 Text(
//                                   '$_counter',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 // SizedBox(width: 1),
//                                 IconButton(
//                                   onPressed: _incrementCounter,
//                                   icon: Icon(Icons.add),
//                                   iconSize: 15,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Image.asset("images/image 65.png"),
//                         SizedBox(
//                           width: 25,
//                         ),
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.start,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Mint Seedling"),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Text("LE.20")
//                           ],
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SvgPicture.asset(
//                               "images/x.svg",
//                               height: 15,
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   onPressed: _decrementCounter,
//                                   icon: Icon(Icons.remove),
//                                   iconSize: 15,
//                                 ),
//                                 SizedBox(width: 2),
//                                 Text(
//                                   '$_counter',
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 // SizedBox(width: 1),
//                                 IconButton(
//                                   onPressed: _incrementCounter,
//                                   icon: Icon(Icons.add),
//                                   iconSize: 15,
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Row(
//                   children: [
//                     Text(
//                       "Payment Summary",
//                       style:
//                           TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                     ),
//                   ],
//                 ),
//                 // payment_summary(),
//                 // payment_summary(),
//                 // payment_summary(),
//                 // payment_summary(),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Divider(
//                   color: Color(0xffB7D7BE),
//                 ),
//                 Column(
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Row(
//                           children: [
//                             Text("  Total",
//                                 style: TextStyle(
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.bold,
//                                     color: Color(0xff184F27))),
//                           ],
//                         ),
//                         Row(
//                           children: [
//                             Text(
//                               "LE 150.40",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Color(0xff184F27)),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         foregroundColor: Colors.white,
//                         backgroundColor: Color(0xFF1B602D),
//                         padding: EdgeInsets.symmetric(
//                           vertical: 10,
//                           horizontal: 100,
//                         ),
//                       ),
//                       onPressed: () {},
//                       child: const Text("continue",
//                           style: TextStyle(fontSize: 17)),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
