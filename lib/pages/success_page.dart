import 'package:flutter/material.dart';

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
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_animationController);
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF1FCF3),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ScaleTransition(
                scale: _animation,
                child: Image.asset(
                  "images/Animation.gif",
                )
                ),
            SizedBox(height: 20),
            FadeTransition(
              opacity: _animation,
              child: Text(
                '''You have Successfully made a
                  payment ''',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff1B602D)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



