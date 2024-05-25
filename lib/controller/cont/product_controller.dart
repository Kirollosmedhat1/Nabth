import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final productlist = [].obs;
  final searchList = [].obs;
  var isExpanded = false.obs;
  TextEditingController searchcontroller = TextEditingController();

  void getProduct() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("Agrimarket")
          .get();

      productlist.addAll(querySnapshot.docs);
    } catch (e) {
      print("Error getting productlist: $e");
    }
  }

  void addSearchToList(String searchName) {
    searchList.value = productlist
        .where((search) =>
            search["name"].toLowerCase().contains(searchName.toLowerCase()))
        .toList();
  }
  
  void toggle() {
    isExpanded.value = !isExpanded.value;
  }

  void clearSearch() {
    searchcontroller.clear();
    addSearchToList("");
  }
  
  void toggleAndClearSearch() {
  toggle();
  clearSearch();
}

  @override 
  void onInit() {
    getProduct();
    super.onInit();
  }
}
