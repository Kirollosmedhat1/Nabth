import 'package:application5/pages/agriMarket/Payment_Page.dart';
import 'package:application5/widgets/myTextFromField.dart';
import 'package:application5/widgets/myButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';
import 'package:phone_input/phone_input_package.dart';

class checkout extends StatefulWidget {
  const checkout({super.key});

  @override
  State<checkout> createState() => _checkoutState();
  
}

class _checkoutState extends State<checkout> {
  GlobalKey<FormState> fromstate2 = GlobalKey<FormState>();
  
  int _selectedIndex =1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            key: fromstate2,
            child: Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: 900,
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(20), right: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Delivery Address",
                    style: TextStyle(fontSize: 20, color: Color(0xff1A7431)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  myTextFromFiled(
                  
                    hintText: "Building Name",
                    validator: (val) {
                      if (val == "") {
                        return "cant not to empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
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
                              return null;
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
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
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  myTextFromFiled(
                    hintText: "Street Name",
                    validator: (val) {
                      if (val == "") {
                        return "cant not to empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  myTextFromFiled(
                    hintText: "Additional Direction(Optional)",
                    validator: (val) {
                      if (val == "") {
                        return "cant not to empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PhoneInput(
                    key: const Key('phone-field'),
                    controller: null,
                    initialValue: null,
                    shouldFormat: true,
                    defaultCountry: IsoCode.EG,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              const BorderSide(color: Color(0xffB7D7BE))),
                    ),
                    validator: PhoneValidator.validMobile(),
                    isCountrySelectionEnabled: true,
                    countrySelectorNavigator:
                        const CountrySelectorNavigator.bottomSheet(),
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
                  const SizedBox(
                    height: 200,
                  ),
                  Center(
                    child: MyButton(lable: "Continue",onPressed: () {
                            if (fromstate2.currentState!.validate()) {
                            Get.to(PaymentPage2());
                          }
                          },),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



