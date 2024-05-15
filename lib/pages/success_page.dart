import 'package:application5/pages/bottom_Bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentSuccessPage extends StatefulWidget {
  @override
  _PaymentSuccessPageState createState() => _PaymentSuccessPageState();
}

class _PaymentSuccessPageState extends State<PaymentSuccessPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
    _animationController.forward();

    // Delay navigation by 3 seconds
    Future.delayed(const Duration(seconds: 4), () {
      Get.off(BottomBar(selectedIndex: 1,)); // Navigate to NextPage after 3 seconds
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1FCF3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _animation,
              child: Image.asset(
                "images/Animation.gif",
              ),
            ),
            const SizedBox(height: 20),
            FadeTransition(
              opacity: _animation,
              child: const Text(
                '''You have Successfully made a
                  payment ''',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff1B602D),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Page"),
      ),
      body: const Center(
        child: Text(
          "This is the next page!",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
