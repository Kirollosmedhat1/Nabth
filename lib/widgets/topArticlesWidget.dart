import 'package:application5/controller/cont/cycleController.dart';
// import 'package:application5/pages/cycle_Item_Info.dart';
import 'package:application5/pages/cycle&tips/topArticle_Item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

class TopArticleWidget extends StatefulWidget {
  final String image;
  final String name;
  final String article;
  final List<String> steps;
  final String readtime;
  final bool favorite;
  final Timestamp date;

  const TopArticleWidget({
    super.key,
    required this.image,
    required this.name,
    required this.steps,
    required this.article,
    required this.readtime,
    required this.favorite,
    required this.date,
  });

  @override
  State<TopArticleWidget> createState() => _TopArticleWidgetState();
}

class _TopArticleWidgetState extends State<TopArticleWidget> {
  late bool _isFavorite; // Declare _isFavorite without initialization
  final CycleController _controller = Get.find(); // Get CycleController instance

  @override
  void initState() {
    super.initState();
    // Initialize the initial favorite state
    _isFavorite = widget.favorite; // Initialize _isFavorite with the initial favorite state from the widget
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(TopArticleItem(
          image: widget.image,
          name: widget.name,
          steps: widget.steps,
          article: widget.article,
          readtime: widget.readtime,
          favorite: _isFavorite, // Pass the current favorite state to the TopArticleItem
          date: widget.date,
        ));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color(0xffCAEDCF))),
        height: 62.29,
        child: Row(
          children: [
            Container(
              height: 52,
              width: 56,
              decoration: BoxDecoration(
                image: const DecorationImage(
                    image: AssetImage("images/1.png"), fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              width: 200,
              child: Text(
                widget.name,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                setState(() {
                  _isFavorite = !_isFavorite; // Invert the favorite state
                });
                await _controller.toggleFavorite(widget.name, _isFavorite);
                // Other navigation or actions
              },
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: _isFavorite
                            ? const AssetImage("images/Heart.png")
                            : const AssetImage("images/HeartSelecteed.png"))),
              ),

            ),
            
          ],
        ),
      ),
    );
  }
}
