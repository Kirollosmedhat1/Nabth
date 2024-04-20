import 'package:application5/pages/Payment_Page2.dart';
import 'package:application5/pages/myTextFromField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:phone_input/phone_input_package.dart';

class checkout extends StatefulWidget {
  checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
  
}

class _checkoutState extends State<checkout> {
  GlobalKey<FormState> fromstate2 = GlobalKey<FormState>();
  
  int _selectedIndex =1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1FCF3),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        onTabChange: (index) {
          
        },
        borderColor: Color(0xff1E9B3D),
        barColor: Colors.white,
        domeCircleColor: Color(0xffCAEDCF),
        tabs: [
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 0
                  ? 'images/home-selected.png'
                  : 'images/home.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'home',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 1
                  ? 'images/store-selected.png'
                  : 'images/store.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'AgriMarket',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 2
                  ? 'images/scan-selected.png'
                  : 'images/scan.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Scan',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 3
                  ? 'images/community-selected.png'
                  : 'images/community.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Community',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 4
                  ? 'images/profile-selected.png'
                  : 'images/profile.png',
            ),
            selectedColor: Color(0xff1E9B3D),
            title: Text(
              'Account',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCF3),
        leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Image.asset(
                  "images/back.png",
                  height: 20,
                )),
        title:
            
            Text(
              "Checkout",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1B602D)),
            ),
          
      ),
      body: ListView(
        children: [
          Form(
            key: fromstate2,
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              height: 900,
              decoration: BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Delivery Address",
                    style: TextStyle(fontSize: 20, color: Color(0xff1A7431)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  myTextFromFiled(
                    hintText: "Building Name",
                    validator: (val) {
                      if (val == "") {
                        return "cant not to empty";
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: 170,
                          height: 50,
                          child: myTextFromFiled(
                            hintText: "Apartment no.",
                            validator: (val) {
                              if (val == "") {
                                return "cant not to empty";
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        width: 170,
                        height: 50,
                        child: myTextFromFiled(
                          hintText: "Floor no.",
                          validator: (val) {
                            if (val == "") {
                              return "cant not to empty";
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  myTextFromFiled(
                    hintText: "Street Name",
                    validator: (val) {
                      if (val == "") {
                        return "cant not to empty";
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  myTextFromFiled(
                    hintText: "Additional Direction(Optional)",
                    validator: (val) {
                      if (val == "") {
                        return "cant not to empty";
                      }
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  PhoneInput(
                    key: const Key('phone-field'),
                    controller: null,
                    initialValue: null,
                    shouldFormat: true,
                    defaultCountry: IsoCode.EG,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xffB7D7BE))),
                    ),
                    validator: PhoneValidator.validMobile(),
                    isCountrySelectionEnabled: true,
                    countrySelectorNavigator:
                        CountrySelectorNavigator.bottomSheet(),
                    showFlagInInput: true, // Default
                    flagShape: BoxShape.rectangle, // Default
                    showArrow: true, // Default
                    flagSize: 26, // Default
                    autofillHints: [
                      AutofillHints.telephoneNumber
                    ], // Default to null
                    enabled: true, // Default
                    autofocus: false, // Default
                    // onSaved: (PhoneNumber p) => print('saved $p'), // Default null
                    // onChanged: (PhoneNumber p) => print('changed $p'), // Default null
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Color(0xFF1B602D),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 100,
                        ),
                      ),
                      onPressed: () {
                        if (fromstate2.currentState!.validate()) {
                          Get.to(PaymentPage2());
                        }
                      },
                      child: const Text("continue",
                          style: TextStyle(fontSize: 25)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



