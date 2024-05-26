// ignore_for_file: camel_case_types, file_names

import 'package:application5/controller/cont/authcontroller.dart';
import 'package:application5/pages/agriMarket/MyOrderss.dart';
import 'package:application5/pages/account/editprofile_Page.dart';
import 'package:application5/pages/cycle&tips/favourites_Page.dart';
import 'package:application5/widgets/myACCRow.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Porfile_Page2 extends StatelessWidget {
  final  controller = Get.put(AuthController());
  final ImagePicker _picker = ImagePicker();

  Porfile_Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: const Color(0xffF1FCF3),),
      drawer: const Mydrawer(),
      backgroundColor: const Color(0xffF1FCF3),
      body: Container(
        padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
        child: Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 800,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
              ),
              Positioned(
                top: -50,
                child: Column(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      child: 
                      Obx(() => CircleAvatar(
                            radius: 50,
                            backgroundImage: controller
                                    .displayUserPhoto.value.isNotEmpty
                                ? NetworkImage(
                                    controller.displayUserPhoto.value)
                                : const NetworkImage(
                                    "https://firebasestorage.googleapis.com/v0/b/application5-3bcfb.appspot.com/o/profile_images%2F2024-04-27%2021%3A38%3A28.619365.jpg?alt=media&token=38a95ecd-be26-4306-b3af-97d73fcedcbf")),
                      ),
                    ),
                    const SizedBox(height: 13),
                    Obx(()=>Text(
                      controller.displayUsername.value,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A7431)),
                    ),),
                    Container(
                      padding: const EdgeInsets.all(20),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 150,
                left: -15,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyACCrow(
                          iconImage: "images/IconEditProfile.png",
                          title: "Edit Profile",
                          onTap: () {
                            Get.to(()=>EditProfilePage());
                          },
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromARGB(255, 163, 204, 166),
                        ),
                        const SizedBox(height: 10),
                        MyACCrow(
                          iconImage: "images/IconFavourites.png",
                          title: "Favourites",
                          onTap: () {
                            Get.to(() => const FavouritesPage());
                          },
                        ),
                        const SizedBox(height: 10),
                        const Divider(
                          color: Color.fromARGB(255, 163, 204, 166),
                        ),
                        const SizedBox(height: 10),
                        MyACCrow(
                          iconImage: "images/IconOrders.png",
                          title: "My Orders",
                          onTap: () {
                            Get.to(()=>MyOrderss());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
