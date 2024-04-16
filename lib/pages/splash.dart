// // ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

// import 'package:agri/controller/constant/imgs.dart';
// import 'package:flutter/material.dart';

// class Splash
//  extends StatefulWidget {
//   const Splash
//   ({Key? key}) :super(key: key);

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   bool flag =true;


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:  Column(
//         children: [
//           Positioned(

//             child: 
//           AnimatedSwitcher(duration: Duration(milliseconds: 100),
         
//             child: flag ? Container(
//               width: 297,
//               height: 313,
            
//               key: Key('1'),
//               child:  Image(image: AssetImage(SplashImg))
             
//             ):Container(key: Key('2'),
//             alignment: Alignment.centerRight,
//             width: 200,
//             height: 250,
//             child: Image(image: AssetImage(SplashImg))
//              ,
//             )
//             ))
//         ],
//                     )
  

                  
//                 );
              
      
   
//   }
// }

// import 'package:agri/controller/constant/imgs.dart';
// // import 'package:agri/controller/splashCont';
// import 'package:flutter/material.dart';


// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<Offset> _animation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//    // Use the current state as the TickerProvider
//       duration: Duration(seconds: 5),
//        vsync: this,
//     );
//     final begin = Offset(0, 0);
//     final controlPoint = Offset(0.5, 1);
//     final end = Offset(1, 0);


//     _animation = Tween<Offset>(
//       begin: begin, 
//       end: end).animate(CurvedAnimation(
//         parent: _animationController, 
//         curve: Cubic(controlPoint.dx, controlPoint.dy, controlPoint.dx, controlPoint.dy),),);
//       // ..addStatusListener((status) {
//       //   if (status == AnimationStatus.completed) {
//       //     // Navigate to next screen or perform any action here
//       //   }
//       // });

//     _animationController.forward();
//   }
//     @override
//   void dispose() {
//    super.dispose();
//     _animationController.dispose();
   
//   }

//   @override
//   Widget build(BuildContext context) {
// //     final SplashController splashController = Get.put(SplashController());

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(""),
//       ),
//       body: Center(
//         child: SlideTransition(position: _animation,
//         child: Container(width:200,height: 200,
//         child:  Image(image: AssetImage(SplashImg))),),

//       ),
//     );
//   }}
//       backgroundColor: Colors.white,
//       body: Center(
//         child: GetBuilder<SplashController>(
//           builder: (_){
//             return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: 100),
//                 Image.asset('assets/images/img2.png'),
//                 SizedBox(height: 20),
//                 Obx(() {
//                   return SlideTransition(
//                     position: Tween<Offset>(
//                       begin: Offset(1.0, 0.0),
//                       end: Offset.zero,
//                     ).animate(_animationController),
//                     child: Text(
//                       'First Word',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   );
//                 }),
//                 SizedBox(height: 10),
//                 Obx(() {
//                   return SlideTransition(
//                     position: Tween<Offset>(
//                       begin: Offset(1.0, 0.0),
//                       end: Offset.zero,
//                     ).animate(_animationController),
//                     child: Text(
//                       'Second Word',
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   );
//                 }),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }


