// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterme_credit_card/flutterme_credit_card.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController number = TextEditingController();

  final TextEditingController validThru = TextEditingController();

  final TextEditingController cvv = TextEditingController();

  final TextEditingController holder = TextEditingController();

  final formkey = GlobalKey<FormState>();

  void initState() {
    super.initState();

    number.addListener(() => setState(() {}));
    validThru.addListener(() => setState(() {}));
    cvv.addListener(() => setState(() {}));
    holder.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCF3),
        title: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios),
            ),
            Text(
              "Payment Methods",
              style: TextStyle(color: Color(0xff1B602D),fontWeight: FontWeight.w600,fontSize: 20),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: formkey,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  child: Text(
                    "Credit & Debit Card",
                    style: TextStyle(fontSize: 20, color: Color(0xff1A7431),fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Add new Card",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff1A7431),fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Radio(value: true, groupValue: "ad", onChanged: (t) {})
                  ],
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  height: 180,
                  width: 340,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color.fromARGB(211, 0, 167, 136),
                          Color.fromARGB(214, 13, 173, 144),
                          Color.fromARGB(197, 22, 176, 148),
                          Color.fromARGB(235, 187, 236, 227),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "  Debit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                          ),
                          Text("VISA",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 27))
                        ],
                      ),
                      Image(image: AssetImage("images/sim-card-chip.png")),
                      Text(" 1111    4343    5556    7676",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "  Camelia Waheeb",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 11),
                            ), 
                          Column(
                            children: [
                              Text(
                                "Expires            ",
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                                ),
                             Text(
                                "07/25            ",
                                style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 10),
                                ),
                            ],
                          )
                          ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: Column(
                  children: [
                    FMHolderField(
                      controller: holder,
                      cursorColor: const Color(0xFF1A7431),
                      decoration: InputDecoration(
                        labelText: "Card Holder Name",
                        hintText: "John Doe",
                      ),
                    ),
                    const SizedBox(height: 20),
                    FMNumberField(
                      controller: number,
                      cursorColor: const Color(0xFF1A7431),
                      decoration: InputDecoration(
                        labelText: "Card Number",
                        hintText: "0000 0000 0000 0000",
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: FMValidThruField(
                            controller: validThru,
                            cursorColor: const Color(0xFF1A7431),
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF1A7431),
                                ),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF1A7431)),
                              labelText: "Expiration Date",
                              hintText: "****",
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: FMCvvField(
                            controller: cvv,
                            cursorColor: const Color(0xFF1A7431),
                            decoration: InputDecoration(
                              labelText: "CVV",
                              hintText: "***",
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: true,
                              onChanged: (t) {},
                              activeColor: Color(0xff1A7431),
                            ),
                            Text(
                              "Save Card Info",
                              style: TextStyle(color: Color(0xff1A7431)),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "More Payment options",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff1A7431)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                // Image.asset(
                                //   "images/Vector.png",
                                //   height: 25,
                                // ),
                                SizedBox(
                                  width: 7,
                                ),
                                Text("Cash")
                              ],
                            ),
                            Radio(
                                value: true,
                                groupValue: "ad",
                                onChanged: (t) {})
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF1B602D),
                        padding: const EdgeInsets.symmetric(
                          vertical: 7,
                          horizontal: 90,
                        ),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {}
                      },
                      child: const Text("continue",
                          style: TextStyle(fontSize: 24)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: StylishBottomBar(
      //   option: AnimatedBarOptions(),
      //   items: [
      //     BottomBarItem(icon: Icon(Icons.access_alarm), title: Text('Home')),
      //     BottomBarItem(
      //         icon: Icon((Icons.access_alarm)), title: Text('Search')),
      //     BottomBarItem(
      //         icon: Icon((Icons.access_alarm)), title: Text('Search')),
      //   ],
      //   onTap: (value) {},
      // ),
    );
  }

  // input decoration for card fields
  InputDecoration inputDecoration({
    required String labelText,
    required String hintText,
  }) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xFF49B7AE),
        ),
      ),
      labelStyle: const TextStyle(color: Color(0xFF49B7AE)),
      labelText: labelText,
      hintText: hintText,
    );
  }
}
