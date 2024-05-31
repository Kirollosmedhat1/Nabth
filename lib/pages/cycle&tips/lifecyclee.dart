import 'package:application5/controller/cont/cycleController.dart';
import 'package:application5/widgets/lifecycle_cont.dart';
import 'package:application5/pages/cycle&tips/lifecycle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lifecycleee extends StatefulWidget {
  Lifecycleee({super.key});

  @override
  State<Lifecycleee> createState() => _LifecycleeeState();
}

class _LifecycleeeState extends State<Lifecycleee>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final controller = Get.put(CycleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1FCF3),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1FCF3),
        leading: InkWell(
          onTap: () {},
          // child: Image.asset("images/newmenu.png"),
        ),
      ),
      body: Column(
        children: [
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 20,
          //     ),
          //     InkWell(
          //       onTap: () {},
          //       // child:
          //       // Image.asset(
          //       //   "images/back.png",
          //       //   height: 18,
          //       //   width: 28,
          //       //   color: Color(0xff1A7431),
          //       // ),
          //     ),
          //     SizedBox(
          //       width: 15,
          //     ),
          //     Text(
          //       "AgriCycles",
          //       style: TextStyle(
          //         fontSize: 25,
          //         color: Color(0xff1A7431),
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            width: 326,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(50)),
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: const Color(0xff1A7431),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: const Color(0xff1A7431),
                  borderRadius: BorderRadius.circular(10)),
              tabs: [
                Container(
                  width: 150,
                  child: const Tab(
                    text: 'My Plants',
                  ),
                ),
                Container(width: 150, child: const Tab(text: 'Reminders')),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Content for 'My Plants' Tab
                // Content for 'Reminders' Tab
                Obx(() {
                  if(controller.myplanet.isNotEmpty){
                    return const Lifecycle();
                  }else{

                  
                  return Container(
                      height: 630,
                      width: 600,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(35))),
                      child: ListView.builder(
                          itemCount: controller.myplanet.length,
                          itemBuilder: (context, i) {
                            return container_in_life(
                              img: "${controller.myplanet[i]["img"]}",
                              name: "${controller.myplanet[i]["name"]}",
                            );
                          }));
                }}),
                // Content for 'Reminders' Tab
                Obx(() {
                  return Container(
                      height: 630,
                      width: 600,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(35))),
                      child: ListView.builder(
                          itemCount: controller.myplanet.length,
                          itemBuilder: (context, i) {
                            return container_in_life(
                              img: "${controller.myplanet[i]["img"]}",
                              name: "${controller.myplanet[i]["name"]}",
                            );
                          }));
                })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
