import 'package:flutter/material.dart';

class Lifecycle extends StatefulWidget {
  const Lifecycle({super.key});

  @override
  State<Lifecycle> createState() => _LifecycleState();
}

class _LifecycleState extends State<Lifecycle>
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1FCF3),
      appBar: AppBar(
        backgroundColor: Color(0xffF1FCF3),
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
          //       // child: Image.asset(
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
          SizedBox(
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
              unselectedLabelColor: Color(0xff1A7431),
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: BoxDecoration(
                  color: Color(0xff1A7431),
                  borderRadius: BorderRadius.circular(10)),
              tabs: [
                Container(
                  width: 150,
                  child: Tab(
                    text: 'My Plants',
                  ),
                ),
                Container(width: 150, child: Tab(text: 'Reminders')),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Content for 'My Plants' Tab
                SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 25),
                      Container(
                        height: 630,
                        width: 600,
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(35))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 50,
                            ),
                            // Image.asset(
                            //   "images/tree.png",
                            //   height: 100,
                            //   width: 100,
                            // ),
                            Text(
                              'You have no plants',
                              style: TextStyle(
                                fontSize: 26,
                                color: Color(0xff1A7431),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Add Your First Plant and \n carry out its daily \n Reminders.',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1A7431),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff1A7431),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                              ),
                              child: Text(
                                'Add',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                            SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Content for 'Reminders' Tab
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      // Image.asset(
                      //   "images/tree.png",
                      //   height: 100,
                      //   width: 100,
                      // ),
                      Text(
                        'You have no plants',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xff1A7431),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Add Your First Plant and \n carry out its daily \n Reminders.',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1A7431),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff1A7431),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        child: Text(
                          'Add',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
