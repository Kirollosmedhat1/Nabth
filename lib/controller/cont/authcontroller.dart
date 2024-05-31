// ignore_for_file: avoid_print, deprecated_member_use

import 'dart:io';
import 'package:application5/pages/bottom_Bar.dart';
import 'package:application5/pages/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  static final controller = Get.put(AuthController());
  bool inclick = false;
  bool ontap = false;
  bool islike = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  var isSignedIn = false;
  var displayUsername = "".obs;
  var displayUserID = "".obs;
  var googleSignIn = GoogleSignIn();
  var displayUserPhoto = "".obs;


  final List<String> genderItems = [
    'Male'.tr,
    'Female'.tr,
  ];

  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController gendercontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  User? get userProfile => auth.currentUser;

  @override
  void onInit() {
    if (userProfile != null) {
      displayUsername.value = userProfile!.displayName ?? "";
      displayUserPhoto.value = userProfile!.photoURL ?? "";
      displayUserID.value = userProfile!.uid;

      // displayEmail.value = userProfile!.email!;
    } else {
      displayUsername.value = "";
      displayUserPhoto.value = "";
    }
    super.onInit();
  }

  void updateProfile({
    String? newName,
    String? newPhoneNumber,
    String? newEmail,
    String? newGender,
  }) async {
    try {
      // Get the current user
      User? user = auth.currentUser;

      if (user != null) {
        // Show loading dialog
        Get.dialog(
          const Center(
            child: CircularProgressIndicator(),
          ),
          barrierDismissible:
              false, // Prevent dismissing dialog by tapping outside
        );

        // Update the display name if newName is not null
        if (newName != null) {
          // Update the display name
          await user.updateDisplayName(newName);

          // Check if updateDisplayName is successful
          String updatedName = user.displayName ?? "";
          if (updatedName == newName) {
            displayUsername.value = newName;

            // Update the name in Firestore
            await FirebaseFirestore.instance
                .collection('user')
                .doc(user.uid) // Document ID is user's UID
                .update({'name': newName});
          } else {
            print("Failed to update display name");
            Get.back(); // Dismiss loading dialog
            return; // Return if failed to update display name
          }
        }

        // Update the phone number if newPhoneNumber is not null
        if (newPhoneNumber != null) {
          await FirebaseFirestore.instance
              .collection('user')
              .doc(user.uid)
              .update({'phoneNumber': newPhoneNumber});
        }

        // Update the email if newEmail is not null
        if (newEmail != null) {
          // Update the email in Firebase Authentication
          await user.updateEmail(newEmail);

          // Update the email in Firestore
          await FirebaseFirestore.instance
              .collection('user')
              .doc(user.uid)
              .update({'email': newEmail});
        }

        // Update the gender if newGender is not null
        if (newGender != null) {
          await FirebaseFirestore.instance
              .collection('user')
              .doc(user.uid)
              .update({'gender': newGender});
          // Update local gender value
          gendercontroller.text = newGender;
        }

        Get.back(); // Dismiss loading dialog
        Get.back(); // Close the profile screen
        Get.snackbar("Success", "Profile updated successfully",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      print("Error updating profile: $error");
      Get.back(); // Dismiss loading dialog
      Get.snackbar("Error", "Failed to update profile",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Method to upload profile image to Firebase Storage
  Future<String?> uploadProfileImage(File imageFile) async {
    try {
      // Reference to Firebase Storage bucket
      Reference ref = FirebaseStorage.instance
          .ref()
          .child('profile_images')
          .child('${DateTime.now()}.jpg');

      // Upload image to Firebase Storage
      UploadTask uploadTask = ref.putFile(imageFile);

      // Get download URL of uploaded image
      TaskSnapshot taskSnapshot = await uploadTask;
      String? downloadUrl = await taskSnapshot.ref.getDownloadURL();

      return downloadUrl;
    } catch (error) {
      return null;
    }
  }

  // Method to update user's profile photo URL in Firestore
  Future<void> updateProfilePhoto(String imageUrl) async {
    try {
      User? user = auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(imageUrl);
        // Update the profile photo URL in Firestore
        await FirebaseFirestore.instance
            .collection('user')
            .doc(user.uid)
            .update({'photoURL': imageUrl});

        // Update the local displayUserPhoto value
        displayUserPhoto.value = imageUrl;
      }
    } catch (error) {
      print("Error updating profile photo: $error");
    }
  }

  void inClick() {
    inclick = !inclick;
    update();
  }

  // ignore: non_constant_identifier_names
  void OnTap() {
    ontap = !ontap;
    update();
  }

  void signUpUsingFirebase({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await auth.currentUser!.updateDisplayName(name);

      // Save user's information to Firestore collection
      await FirebaseFirestore.instance
          .collection('user')
          .doc(auth.currentUser!.uid)
          .set({
        'name': name,
        'email': email,
      });

      // Update local displayUsername and displayUserID
      displayUsername.value = name;
      displayUserID.value = auth.currentUser!.uid;

      update();
      Get.offAll(const BottomBar(selectedIndex: 0));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar("weak-password", "The password provided is too weak.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black,
            colorText: Colors.white);
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("email-already-in-use",
            "The account already exists for that email.",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.black,
            colorText: Colors.white);
        print('The account already exists for that email.');
      }
    } catch (error) {
      Get.snackbar("Erorr!", error.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.black,
          colorText: Colors.white);
      print(error);
    }
  }

  void logInUsingFirebase({
    required String email,
    required String password,
  }) async {
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        displayUsername.value = auth.currentUser!.displayName ?? "";
        displayUserID.value = auth.currentUser!.uid;
        // displayEmail.value = userProfile!.email!;
      });

  
      update();
      Get.offAll(const BottomBar(selectedIndex: 0));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("", "",
            messageText: const Column(
              children: [
             
                Text(
                  "No user found for that email",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            snackPosition: SnackPosition.TOP);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Get.snackbar("", "",
            messageText: const Column(
              children: [
                
                Text(
                  "Wrong password provided for that user.",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500),
                )
              ],
            ),
            snackPosition: SnackPosition.TOP);
        print('Wrong password provided for that user.');
      }
    }
  }

  void googleSignUP() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        String name = googleUser.displayName!;
        String email = googleUser.email;

        // Check if a document already exists with the same email
        QuerySnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
            .instance
            .collection('user')
            .where('email', isEqualTo: email)
            .get();

        if (snapshot.docs.isNotEmpty) {
          // Document already exists, display an error message to the user
          Get.snackbar("Error!", "This Google account is already signed up.",
              snackPosition: SnackPosition.TOP);
        } else {
          // Get the user ID from Firebase after signing in
          final UserCredential userCredential = await auth.signInWithCredential(
            GoogleAuthProvider.credential(
              idToken: (await googleUser.authentication).idToken,
              accessToken: (await googleUser.authentication).accessToken,
            ),
          );
          String userId = userCredential.user!.uid;

          // Save user's information to Firestore collection
          await FirebaseFirestore.instance.collection('user').doc(userId).set({
            'name': name,
            'email': email,
          });

          isSignedIn = true;
          
          update();
          Get.offAll(const BottomBar(selectedIndex: 0));
        }
      } else {
        // Handle the case where Google sign-in is canceled or fails
        Get.snackbar("Error!", "Google sign-in canceled or failed.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      Get.snackbar("Error!", "An error occurred while signing up with Google.",
          snackPosition: SnackPosition.BOTTOM);
      print(error);
    }
  }

  void googleSignin() async {
    try {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser != null) {
        // Sign in using Google credentials
        final UserCredential userCredential = await auth.signInWithCredential(
          GoogleAuthProvider.credential(
            idToken: (await googleUser.authentication).idToken,
            accessToken: (await googleUser.authentication).accessToken,
          ),
        );

        // Update local user information
        displayUsername.value = userCredential.user!.displayName ?? "";
        displayUserID.value = userCredential.user!.uid;
        displayUserPhoto.value = userCredential.user!.photoURL ?? "";

        // Update authentication status
      

        // Navigate to the location screen
        Get.offAll(const BottomBar(selectedIndex: 0));
      } else {
        // Handle the case where Google sign-in is canceled
        Get.snackbar("Error!", "Google sign-in canceled.",
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (error) {
      // Handle sign-in errors
      Get.snackbar("Error!", "An error occurred while signing in with Google.",
          snackPosition: SnackPosition.BOTTOM);
      print(error);
    }
  }

  void resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.snackbar("Alert", "Check your email");
      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        Get.snackbar(
          "Error",
          "Enter a valid email",
        );
      } else if (e.code == 'user-not-found') {
        Get.snackbar(
          "Error",
          "No user found for that email",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        // Handle other FirebaseAuthExceptions
        print("FirebaseAuthException: ${e.message}");
      }
    } catch (e) {
      // Handle other errors
      print("Error: $e");
    }
  }

  void facebookSignupApp() {}

  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      displayUsername.value = "";
      displayUserPhoto.value = "";
      displayUserID.value = "";
      // displayEmail.value = "";
     
      update();
      Get.offAll(const SignUp());
    } catch (error) {
      Get.snackbar("Erorr!", error.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.amber,
          colorText: Colors.white);
    }
  }

  

  void deleteUserAccount() async {
    try {
      // Sign out from Google Sign-In
      await googleSignIn.signOut();

      // Get the current user ID
      String userId = auth.currentUser!.uid;

      // Delete the user document from the "users" collection
      await FirebaseFirestore.instance.collection('user').doc(userId).delete();

      // Delete Firebase user account
      User? user = FirebaseAuth.instance.currentUser;
      await user!.delete();

      // Update local user information and authentication status
      displayUsername.value = "";
      displayUserPhoto.value = "";
      displayUserID.value = "";
      isSignedIn = false;
      
      update();

      Get.offAll(const SignUp());

      print('User account deleted successfully.');
    } catch (e) {
      print('Failed to delete user account: $e');
      Get.snackbar("Error!", "Failed to delete user account.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}