import 'package:flutter/material.dart';

class PrivacySecurityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {},
      //     icon: Image.asset(
      //       "images/IconBack.png",
      //       height: 15,
      //     ),
      //   ),
      //   title: Center(child: Text('Privacy & Security')),
      // ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, top: 50, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "images/IconBack.png",
                          height: 15,
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Text(
                        'Privacy & Security',
                        style: TextStyle(
                            color: Color(0xff1A7431),
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Divider(
                    height: 20,
                    color: Color(0xff1A7431),
                  )
                ],
              ),
              Text(
                '1. Data Collection : We collect personal \n information such as name, email \n address, and phone number only when \n voluntarily provided by users for\n registration, support, or other services\n within the application.',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),
              Text(
                '2. Usage Information : We may gather non-personal information about users\' interactions with the application, including device type, operating system, and browsing actions, to improve user experience and optimize our services.',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '3. Cookies and Tracking : Our application may use cookies and similar tracking technologies to enhance user experience and collect data on usage patterns. Users can manage cookie preferences through their browser settings.',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 16),
              SizedBox(height: 8),
              Text(
                '4. Data Usage :Any personal information collected is used solely for the purpose for which it was provided, such as account management, communication, and improving our services. We do not sell or share personal information with third parties for marketing purposes.',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
