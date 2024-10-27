import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:example_designer2/home_bage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class Animationss extends StatelessWidget {
  const Animationss({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Stack(
        children:[ 
          Container(
            width: 400,
            height: 420,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(230),
            )
          ),
          CircleAvatar(
          foregroundColor:Colors.white,
          radius: 200,
          backgroundColor: Colors.white,
          backgroundImage: AssetImage('assets/images/bv.jpg'),
          ),
          
          ]
      ),
      
      // Column(
      //   children: [
      //     Center(
      //       child: LottieBuilder.asset(
      //           'assets/Lottie/Animation - 1730001284037.json'),
      //     ),
      //   ],
      // ),
      nextScreen: HomeBage(),
      splashTransition: SplashTransition.rotationTransition,
      splashIconSize: 390,
      backgroundColor: Color(0xff104879),
    );
  }
}
