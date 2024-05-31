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
                SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 25),
                      Container(
                        height: 630,
                        width: 600,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(35))),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            // Image.asset(
                            //   "images/tree.png",
                            //   height: 100,
                            //   width: 100,
                            // ),
                            const Text(
                              'You have no plants',
                              style: TextStyle(
                                fontSize: 26,
                                color: Color(0xff1A7431),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 10),
                            const Text(
                              'Add Your First Plant and \n carry out its daily \n Reminders.',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1A7431),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff1A7431),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 10),
                              ),
                              child: const Text(
                                'Add',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                            const SizedBox(height: 50),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Content for 'Reminders' Tab
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      // Image.asset(
                      //   "images/tree.png",
                      //   height: 100,
                      //   width: 100,
                      // ),
                      const Text(
                        'You have no plants',
                        style: TextStyle(
                          fontSize: 26,
                          color: Color(0xff1A7431),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Add Your First Plant and \n carry out its daily \n Reminders.',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff1A7431),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff1A7431),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                        ),
                        child: const Text(
                          'Add',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 50),
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
