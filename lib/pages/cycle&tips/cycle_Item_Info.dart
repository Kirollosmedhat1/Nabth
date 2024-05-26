import 'package:application5/widgets/cycleInfoContainer.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CycleItem extends StatelessWidget {
  const CycleItem({
    Key? key,
    required this.image,
    required this.name,
    required this.cat,
    required this.afterCaring,
    required this.conditions,
    required this.harvesting,
    required this.timing,
    required this.watering,
    required this.steps,
  }) : super(key: key);

  final String image;
  final String name;
  final String cat;
  final String afterCaring;
  final String conditions;
  final String harvesting;
  final String timing;
  final String watering;
  final List<String> steps;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: const Mydrawer(),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  "images/back.png",
                  height: 15,
                ),
              ),
              const SizedBox(
                width: 60,
              ),
              Text(
                name,
                style: const TextStyle(
                    color: Color(0xff4F795B),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: "WorkSans"),
              ),
            ],
          ),
          const Divider(
            color: Color(0xffB7D7BE),
          ),
          CycleInfoContainer(title: "conditions", info: conditions),
          CycleInfoContainer(title: "timing", info: timing),
          Container(
            margin: const EdgeInsets.only(top: 30),
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xffF2F2F2)),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "   Steps",
                  style: TextStyle(
                      color: Color(0xff4F795B),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: "WorkSans"),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: steps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(steps[index]),
                    );
                  },
                ),
              ],
            ),
          ),
          CycleInfoContainer(title: "Watering", info: watering),
          CycleInfoContainer(title: "After Caring", info: afterCaring),
          CycleInfoContainer(title: "Harvesting", info: harvesting),
        ],
      ),
    );
  }
}
