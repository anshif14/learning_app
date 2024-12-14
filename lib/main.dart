import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:learning_app/features/auth/screens/signup_screen.dart';

import 'core/local_variable.dart';
import 'features/auth/screens/splash_screen.dart';

void main(){
  print('mainnnnnnnnnnn');


  runApp(MyApp());
      
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print('objectttttttttttttttt');
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
