// ignore_for_file: prefer_const_constructors
import 'package:application5/controller/cont/authcontroller.dart';
import 'package:application5/pages/cycle&tips/agri_Tips.dart';
import 'package:application5/widgets/home_Container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());


  final ImagePicker _picker = ImagePicker();
  final Function(int) onTabChanged; // Callback function
   HomePage({Key? key, required this.onTabChanged}) : super(key: key);
  void changeSelectedIndex() {
    onTabChanged(1);
    onTabChanged(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'images/HomeBackground.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              CustomAppBar(
                title: Text(''),
                onMenuPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
              Obx(()=>Container(
                padding: EdgeInsets.symmetric(horizontal: 60),
                // color: Colors.black,
                child: RichText(
                    text: TextSpan(children:[
                  TextSpan(
                    text: controller.displayUsername.value,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.w600),
                  ),
                  TextSpan(
                    text: "\nFind Your Desire Agriculture\nSolution.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontFamily: "WorkSans",
                        fontWeight: FontWeight.w600),
                  )
                ])),
              ),),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            onTabChanged(2);
                          },
                          child: Container(
                            height: 45,
                            width: 275,
                            margin: EdgeInsets.only(top: 28),
                            decoration: BoxDecoration(
                              color: Color(0xff1B602D),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  height: 22,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "images/Home_Scan_Button.png"))),
                                ),
                                Text(
                                  "Detect your plant Disease",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "WorkSans"),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        HomeContainer(
                          padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                          widget: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  Get.to(AgryCycle());
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/Icontips.png"),
                                              fit: BoxFit.cover)),
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: "Tips & Information",
                                            style: TextStyle(
                                              color: Color(0xff1B602D),
                                              fontFamily: "WorkSans",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.24,
                                            ),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                "\nCultivating with expertise and \ndistinction.",
                                            style: TextStyle(
                                              color: Color(0xff4F795B),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ]))
                                  ],
                                ),
                              ),
                              Divider(
                                color: Color(0xffF1FCF3),
                                thickness: 2,
                              ),
                              InkWell(
                                onTap: () {
                                  onTabChanged(3);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "images/IconcommunityHome.png"),
                                              fit: BoxFit.cover)),
                                    ),
                                    RichText(
                                        text: TextSpan(
                                            text: "Community",
                                            style: TextStyle(
                                              color: Color(0xff1B602D),
                                              fontFamily: "WorkSans",
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              letterSpacing: -0.24,
                                            ),
                                            children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                "\nAsk questions and get support.",
                                            style: TextStyle(
                                              color: Color(0xff4F795B),
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ]))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: HomeContainer(
                              padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                              widget: Row(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              text: "Plant Life Cycle",
                                              style: TextStyle(
                                                color: Color(0xff1B602D),
                                                fontFamily: "worksansbold",
                                                fontSize: 28,
                                                letterSpacing: -0.24,
                                              ),
                                              children: <TextSpan>[
                                            TextSpan(
                                              text:
                                                  "\nTake step to start \nplanting.",
                                              style: TextStyle(
                                                fontFamily: "WorkSans",
                                                color: Color(0xff4F795B),
                                                fontSize: 24,
                                              ),
                                            ),
                                          ])),
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        height: 100,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black12,
                                                  spreadRadius: 2,
                                                  blurRadius: 2,
                                                  blurStyle: BlurStyle.normal,
                                                  offset: Offset(0, 0))
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                              color: Color(0xffF1FCF3),
                                              width: 2,
                                            ),
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    "images/gifCycle.gif"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ),
                        InkWell(
                          onTap: () {
                            onTabChanged(1);
                          },
                          child: HomeContainer(
                              padding: EdgeInsets.symmetric(horizontal: 25),
                              widget: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                      text: TextSpan(
                                          text:
                                              "Get 10% off\non your\nfirst order ",
                                          style: TextStyle(
                                            wordSpacing: -1,
                                            color: Color(0xff1A7431),
                                            fontFamily: "worksansbold",
                                            fontSize: 28,
                                            letterSpacing: -0.24,
                                          ),
                                          children: <TextSpan>[
                                        TextSpan(
                                          text: "\nAgriMarket",
                                          style: TextStyle(
                                            fontFamily: "WorkSans",
                                            color: Color(0xff1E9B3D),
                                            fontSize: 26,
                                          ),
                                        ),
                                      ])),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    height: 150,
                                    width: 135,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black12,
                                              spreadRadius: 2,
                                              blurRadius: 2,
                                              blurStyle: BlurStyle.normal,
                                              offset: Offset(0, 0))
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                          color: Color(0xffF1FCF3),
                                          width: 2,
                                        ),
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "images/agriMarketOffer.png"),
                                            fit: BoxFit.cover)),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 70,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

FirebaseAuth auth = FirebaseAuth.instance;
var googleSignIn = GoogleSignIn();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final AuthController controller = Get.put(AuthController());


  final ImagePicker _picker = ImagePicker();
  final Function()? onMenuPressed;

   CustomAppBar({required this.title, this.onMenuPressed});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: title,
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: Colors.white,
          size: 30,
        ),
        onPressed: onMenuPressed,
      ),
      actions: [
        Obx(() => CircleAvatar(
                            backgroundImage: controller
                                    .displayUserPhoto.value.isNotEmpty
                                ? NetworkImage(
                                    controller.displayUserPhoto.value)
                                : const NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/application5-3bcfb.appspot.com/o/profile_images%2F2024-04-27%2021%3A38%3A28.619365.jpg?alt=media&token=38a95ecd-be26-4306-b3af-97d73fcedcbf")),
                      ),
        Container(
          width: 20,
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
