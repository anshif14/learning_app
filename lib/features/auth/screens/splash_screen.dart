import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_app/core/constants/assets_constants.dart';
import 'package:learning_app/core/local_variable.dart';
import 'package:learning_app/features/auth/screens/login_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
   SplashScreen({super.key});
  bool navigated = false;

  @override

  Widget build(BuildContext context) {
    print('buidddddddddddddd');
    if(navigated==false){
      navigated = true;
    Future.delayed(Duration(seconds: 4)).then((value) =>
    // Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => LoginScreen(),))
    Navigator.push(
        context,
        PageTransition(
            alignment: Alignment.center,
            type: PageTransitionType.rotate,
            duration: Duration(seconds: 1),
            child: LoginScreen())));

    }

    return Scaffold(
      body: SizedBox(
        height: height,
        width: width,
        child: Lottie.asset(AssetsConstants.splash, fit: BoxFit.fill),
      ),
    );
  }
}
