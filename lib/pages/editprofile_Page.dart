import 'dart:io';

import 'package:application5/controller/cont/authcontroller.dart';
import 'package:application5/widgets/formTextfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthController controller = AuthController();


  final ImagePicker _picker = ImagePicker();

  void _getImage(ImageSource source) async {
    final XFile? pickedImage = await _picker.pickImage(source: source);
    if (pickedImage != null) {
      // Upload the image to Firebase Storage
      final imageUrl =
          await controller.uploadProfileImage(File(pickedImage.path));
      if (imageUrl != null) {
        // Update the profile photo in Firestore
        await controller.updateProfilePhoto(imageUrl);
      }
    }
  }

  void _getImageOptions() {
    showModalBottomSheet(
      context: Get.context!,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_enhance_sharp),
                title: const Text('Camera'),
                onTap: () {
                  _getImage(ImageSource.camera); // Open camera
                  Get.back(); // Close the bottom sheet
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () {
                  _getImage(ImageSource.gallery); // Open gallery
                  Get.back(); // Close the bottom sheet
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 18),
          child: IconButton(
            onPressed: () {Get.back();},
            icon: const Icon(Icons.arrow_back_ios),
            color: const Color(0xff1A7431),
            iconSize: 20,
          ),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
              color: Color(0xff1A7431),
              fontSize: 20,
              letterSpacing: -0.24,
              fontFamily: "WorkSans",
              fontWeight: FontWeight.w600),
        ),centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Column(
                children: [
                  Divider(
                    height: 20,
                    color: Color(0xff1A7431),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Obx(()=> CircleAvatar(
                radius: 72.5,
                // backgroundColor: Color(0xffFFF2B9),
                backgroundImage: controller.displayUserPhoto.value.isNotEmpty
                                ? NetworkImage(
                                    controller.displayUserPhoto.value)
                                : const NetworkImage( "https://firebasestorage.googleapis.com/v0/b/application5-3bcfb.appspot.com/o/profile_images%2F2024-04-27%2021%3A38%3A28.619365.jpg?alt=media&token=38a95ecd-be26-4306-b3af-97d73fcedcbf")
              ),),
              const SizedBox(height: 8),
              TextButton(
                onPressed: () {
                  _getImageOptions();
                },
                child: const Text(
                  'Update New Photo ',
                  style: TextStyle(
                      color: Color(0xff152EE0),
                      letterSpacing: -0.24,
                      fontFamily: "WorkSans",
                      fontWeight: FontWeight.w300,
                      fontSize: 20),
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '   Change Username ',
                        style: TextStyle(
                            color: Color(0xff1A7431),
                            letterSpacing: -0.24,
                            fontFamily: "WorkSans",
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextFormField2(
                      hintText: 'Enter New Username',
                      mycontroller: _usernameController),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '   Change Email  ',
                        style: TextStyle(
                            color: Color(0xff1A7431),
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.24,
                            fontFamily: "WorkSans",
                            fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextFormField2(
                      hintText: 'Enter New Email',
                      mycontroller: _emailController),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  const Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      const Text(
                        '   Create New Password   ',
                        style: TextStyle(
                            color: Color(0xff1A7431),
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.24,
                            fontFamily: "WorkSans",
                            fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  MyTextFormField2(
                      hintText: 'Create New Password',
                      mycontroller: _passwordController),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff1A7431),
                      borderRadius: BorderRadius.circular(15)),
                  width: 162,
                  height: 50,
                  child: const Center(
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.24,
                        fontFamily: "WorkSans",
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
