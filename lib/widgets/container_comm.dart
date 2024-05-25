import 'package:flutter/material.dart';

class container_comm extends StatefulWidget {
  final String image;
  final String text1;
  final String text2;

  const container_comm({
    required this.image,
    required this.text1,
    required this.text2,
  });

  @override
  State<container_comm> createState() => _container_commState();
}

class _container_commState extends State<container_comm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xffF1FCF3),
        border: Border.all(color: const Color(0xffB7D7BE)),
        borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.only(left: 25,top: 25),
      child: Column(
        children: [
          Column(
            children: [
              Image.asset(
                widget.image,
                height: 100,
                fit: BoxFit.fill,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(4, 7, 4, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.text1}",
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Color(0xff4F795B),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        fontFamily: "WorkSans",
                      ),
                    ),
                    const SizedBox(height: 3),
                    Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "images/person.png",
                      height: 15,
                      width: 15,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text("${widget.text2}",
                  style: const TextStyle(
                  color: Color(0xff67717A),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontFamily: "WorkSans",
                ),
                  ),
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                children: [
                  const SizedBox(width: 10,),
                  InkWell(
                    onTap: () {
                      
                    },
                    child: Container(
                      color: Colors.white,
                      width: 64,
                      height: 15,
                      child: 
                       const Center(
                         child: Text(
                          "Join Now",
                         style: TextStyle(
                          color: Color(0xff4F795B),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          fontFamily: "WorkSans",
                                           ),
                                           ),
                       ),
                    ),
                  ),
                ],
              )
                  ],
                ),
              ),
              
            ],
          ),
        ],
      ),
    );
  }
}
