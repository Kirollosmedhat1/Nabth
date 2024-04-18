import 'package:application5/pages/cart_page.dart';
import 'package:application5/pages/homepage.dart';
import 'package:application5/pages/login.dart';
import 'package:application5/widgets/productsItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:application5/controller/cont/product_controller.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class CategoryPage extends StatelessWidget {
  final String category;
  int _selectedIndex = 0;
  

  CategoryPage({required this.category});

  final ProductController controller = Get.find<ProductController>();
  void signOutFromApp() async {
    try {
      await auth.signOut();
      await googleSignIn.signOut();
      Get.off(LoginPage());
      // Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
    } catch (error) {}
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> categoryList = [];

    if (category == "Seedlings") {
      categoryList = controller.productlist
          .where((product) => product["cat"] == "Seedlings")
          .toList();
    } else if (category == "Fertilizers") {
      categoryList = controller.productlist
          .where((product) => product["cat"] == "Fertilizers")
          .toList();
    } else if (category == "Farming Tools") {
      categoryList = controller.productlist
          .where((product) => product["cat"] == "Farming Tools")
          .toList();
    }

    return Scaffold(
       drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  " Agri",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff184F27)),
                ),
                Text(
                  "livia",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff2CBB50)),
                ),
              ],
            ),
            Container(
              height: 50,
            ),
            ListTile(
              leading: Image.asset("images/settings.png"),
              title: Text(
                'Settings',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/notification.png"),
              title: Text(
                'Notifications',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/appearance.png"),
              title: Text(
                'Appearance',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/edit.png"),
              title: Text(
                'Edit account',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/language.png"),
              title: Text(
                'Language',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Image.asset("images/Security.png"),
              title: Text(
                'Privacy and Security',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Spacer(),
            ListTile(
              leading: Image.asset("images/logout.png"),
              title: Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xff184F27),
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              onTap: () {
                signOutFromApp();
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: MoltenBottomNavigationBar(
        selectedIndex: _selectedIndex,
        domeHeight: 25,
        onTabChange: (Index) {},
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
        actions: [
          IconButton(onPressed: () {}, icon: Image.asset("images/search.png")),
          IconButton(
              onPressed: () {
                Get.to(CartPage());
              },
              icon: Image.asset("images/cart.png")),
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.only(left: 30, right: 30, top: 20),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 42,
          crossAxisSpacing: 90,
        ),
        itemCount: categoryList.length,
        itemBuilder: (context, i) {
          return ProductItemsWidget(
            img: "${categoryList[i]["img"]}",
            name: "${categoryList[i]["name"]}",
            price: "${categoryList[i]["price"]}",
          );
        },
      ),
    );
  }
}
