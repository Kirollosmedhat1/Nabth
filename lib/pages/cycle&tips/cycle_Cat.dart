import 'package:application5/controller/cont/cycleController.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/login.dart';
import 'package:application5/widgets/cycleItemWidget.dart';
import 'package:application5/widgets/heading_with_back.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  int _selectedIndex = 0;
  CategoryPage({required this.category});

  final CycleController controller = Get.find<CycleController>();
  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      Get.off(const LoginPage());
      // Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> categoryList = [];

    if (category == "Vegatables") {
      categoryList = controller.agricyclesList
          .where((product) => product["cat"] == "Vegatables")
          .toList();
    } else if (category == "Legumes") {
      categoryList = controller.agricyclesList
          .where((product) => product["cat"] == "Legumes")
          .toList();
    } else if (category == "Herbs") {
      categoryList = controller.agricyclesList
          .where((product) => product["cat"] == "Herbs")
          .toList();
    } else if (category == "Flowers") {
      categoryList = controller.agricyclesList
          .where((product) => product["cat"] == "Flowers")
          .toList();
    }

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Mydrawer(),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        onTabChange: (Index) {},
        borderColor: const Color(0xff1E9B3D),
        barColor: Colors.white,
        domeCircleColor: const Color(0xffCAEDCF),
        tabs: [
          MoltenTab(
            icon: Image.asset(
              _selectedIndex == 0
                  ? 'images/home-selected.png'
                  : 'images/home.png',
            ),
            selectedColor: const Color(0xff1E9B3D),
            title: const Text(
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
            selectedColor: const Color(0xff1E9B3D),
            title: const Text(
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
            selectedColor: const Color(0xff1E9B3D),
            title: const Text(
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
            selectedColor: const Color(0xff1E9B3D),
            title: const Text(
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
            selectedColor: const Color(0xff1E9B3D),
            title: const Text(
              'Account',
              style: TextStyle(color: Color(0xff1E9B3D)),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1FCF3),
      ),
      body: Container(
        color: const Color(0xffF1FCF3),
        child: Column(
          children: [
            HeadingWithBack(title: category, fontFamily: "WorkSans"),
            Expanded(
              child: Container(
                  padding: const EdgeInsets.all(15),
                  margin: const EdgeInsets.only(top: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categoryList.length,
                      itemBuilder: (constex, i) {
                        return Stack(
                          alignment: const Alignment(0.94, 0.88),
                          children: [
                            CycleItemWidget(
                              image: "${categoryList[i]["img"]}",
                              name: "${categoryList[i]["name"]}",
                              cat: "${categoryList[i]["cat"]}",
                              afterCaring: "${categoryList[i]["After Caring"]}",
                              conditions: "${categoryList[i]["Conditions"]}",
                              harvesting: "${categoryList[i]["Harvesting"]}",
                              steps: (categoryList[i]["Steps"] as List<dynamic>)
                                  .map((step) => step.toString())
                                  .toList(),
                              timing: "${categoryList[i]["Timing"]}",
                              watering: "${categoryList[i]["Watering"]}",
                            ),
                          ],
                        );
                      })),
            ),
          ],
        ),
      ),
    );
  }
}
