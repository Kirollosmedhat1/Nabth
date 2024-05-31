import 'package:application5/controller/cont/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchHome extends StatelessWidget {
  SearchHome({super.key});
  final controllers = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      init: ProductController(),
      builder: (_) {
        return Obx(() {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  AnimatedContainer(
                    padding: const EdgeInsets.only(left: 35),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.black38
                      )
                      
                      
                    ),
                    duration: const Duration(milliseconds: 300),
                    width: controllers.isExpanded.value ? 300 : 0,
                    child: controllers.isExpanded.value
                        ? TextField(
                            controller: controllers.searchcontroller,
                            onChanged: (searchName) {
                              controllers.addSearchToList(searchName);
                            },
                            onTapOutside: (event) =>
                                FocusScope.of(context).unfocus(),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 255, 255, 255),
                              contentPadding:
                                  const EdgeInsets.only(top: 0, bottom: 0),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(
                                    color: Colors.white.withOpacity(.2)),
                              ),
                              
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:
                                    const BorderSide(color: Colors.white),
                              ),
                              hintText: "Search".tr,
                              hintStyle: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controllers.toggleAndClearSearch();
                                },
                                icon: const Icon(Icons.close),
                              ),
                            ),
                          )
                        : null,
                  ),
                  IconButton(
                    icon: Image.asset(
                      "images/IconSearch.png",
                      height: 20,
                    ),
                    onPressed: controllers.toggleAndClearSearch,
                  ),
                ],
              ),
            ],
          );
        });
      },
    );
  }
}