import 'package:application5/controller/cont/cycleController.dart';
import 'package:application5/widgets/cycleInfoContainer.dart';
import 'package:application5/widgets/myDrawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopArticleItem extends StatefulWidget {
  const TopArticleItem({
    Key? key,
    required this.image,
    required this.name,
    required this.steps,
    required this.article,
    required this.readtime,
    required this.favorite,
    required this.date,
  }) : super(key: key);

  final String image;
  final String name;
  final String article;
  final List<String> steps;
  final String readtime;
  final bool favorite;
  final Timestamp date;

  @override
  State<TopArticleItem> createState() => _TopArticleItemState();
}

class _TopArticleItemState extends State<TopArticleItem> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.favorite; // Initialize here
  }

  @override
  Widget build(BuildContext context) {
    final CycleController controller = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xffF1FCF3),
      appBar: AppBar(
        backgroundColor: const Color(0xffF1FCF3),
      ),
      drawer: const Mydrawer(),
      body: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  size: 20,
                  color: Color(0xff1A7431),
                ),
              ),
              Container(
                width: 266,
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    color: Color(0xff4F795B),
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: "WorkSans",
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () async {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                  await controller.toggleFavorite(widget.name, isFavorite);
                },
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: isFavorite
                          ? const AssetImage("images/Heart.png")
                          : const AssetImage("images/HeartSelecteed.png"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Divider(
            color: Color(0xffB7D7BE),
          ),
          CycleInfoContainer(title: "conditions", info: widget.article),
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
                    fontFamily: "WorkSans",
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.steps.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(widget.steps[index]),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}











// import 'package:application5/controller/cont/cycleController.dart';
// import 'package:application5/widgets/cycleInfoContainer.dart';
// import 'package:application5/widgets/myDrawer.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class TopArticleItem extends StatefulWidget {
//   TopArticleItem({
//     Key? key,
//     required this.image,
//     required this.name,
//     required this.steps,
//     required this.article,
//     required this.readtime,
//     required this.favorite,
//     required this.date,
//   }) : super(key: key);

//   final String image;
//   final String name;
//   final String article;
//   final List<String> steps;
//   final String readtime;
//   final bool favorite;
//   final Timestamp date;

//   @override
//   State<TopArticleItem> createState() => _TopArticleItemState();
// }

// class _TopArticleItemState extends State<TopArticleItem> {
//   bool isFavorite = true; // Initial favorite state

//   @override
//   void initState() {
//     super.initState();
//     isFavorite = widget.favorite; // Set initial favorite state
//   }
//   @override
//   Widget build(BuildContext context) {
//     final CycleController controller = Get.find();
//     return Scaffold(
//       backgroundColor: Color(0xffF1FCF3),
//       appBar: AppBar(
//         backgroundColor: Color(0xffF1FCF3),
//       ),
//       drawer: const Mydrawer(),
//       body: ListView(
//         padding: const EdgeInsets.all(15),
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   icon: Icon(
//                     Icons.arrow_back_ios_new,
//                     size: 20,
//                     color: Color(0xff1A7431),
//                   )),
//               Container(
//                 width: 266,
//                 child: Text(
//                   widget.name,
//                   style: const TextStyle(
//                       color: Color(0xff4F795B),
//                       fontSize: 17,
//                       fontWeight: FontWeight.w600,
//                       fontFamily: "WorkSans"),
//                 ),
//               ),
//               SizedBox(width: 20,),
//               InkWell(
//               onTap: () async {
//                 setState(() {
//                   isFavorite = !isFavorite;
//                 });
//                 await controller.toggleFavorite(widget.name, isFavorite);
                
//               },
//               child: Container(
//                 height: 15,
//                 width: 15,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     image: DecorationImage(
//                         image: isFavorite
//                             ? AssetImage("images/Heart.png")
//                             : AssetImage("images/HeartSelecteed.png"))),
//               ),
//             )
//             ],
//           ),
//           const Divider(
//             color: Color(0xffB7D7BE),
//           ),
//           CycleInfoContainer(title: "conditions", info: widget.article),
//           Container(
//             margin: const EdgeInsets.only(top: 30),
//             padding: const EdgeInsets.fromLTRB(15, 15, 15, 20),
//             decoration: BoxDecoration(
//               border: Border.all(color: const Color(0xffF2F2F2)),
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "   Steps",
//                   style: TextStyle(
//                       color: Color(0xff4F795B),
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                       fontFamily: "WorkSans"),
//                 ),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: widget.steps.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(widget.steps[index]),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
