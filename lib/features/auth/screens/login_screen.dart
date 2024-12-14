import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/core/constants/assets_constants.dart';
import 'package:learning_app/features/auth/screens/signup_screen.dart';
import 'package:learning_app/features/home/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/local_variable.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool passwordVisibility = true;
  final formKey = GlobalKey<FormState>();
  final passwordValidation =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://media.tenor.com/WD7YUcrorx8AAAAM/fire-flame.gif'),
                fit: BoxFit.cover)),
        child: Padding(
          padding: EdgeInsets.all(width * 0.03),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image.asset(AssetsConstants.login),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[200],
                        labelText: "UserName",
                        hintText: "Please enter your name",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * 0.03),
                            borderSide: BorderSide(color: Colors.purple))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    obscureText: passwordVisibility,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (!passwordValidation.hasMatch(value!)) {
                        return "enter a valid password";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blue[200],
                        suffixIcon: IconButton(
                            onPressed: () {
                              passwordVisibility = !passwordVisibility;
                              print(passwordVisibility);
                              setState(() {});
                            },
                            icon: passwordVisibility
                                ? Icon(CupertinoIcons.eye)
                                : Icon(CupertinoIcons.eye_slash)),
                        labelText: "Password",
                        hintText: "Please enter your password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.purple))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (nameController.text != "" &&
                        passwordController.text != "" &&
                        formKey.currentState!.validate()) {
                      Navigator.push(
                          context,
                          PageTransition(
                              childCurrent: LoginScreen(),
                              alignment: Alignment.center,
                              type: PageTransitionType.fade,
                              duration: Duration(seconds: 1),
                              child: HomeScreen()));
                      showMessage("Submitted Successfullly", context);
                    } else {
                      nameController.text == ""
                          ? showMessage("please enter your name", context)
                          : passwordController.text == ""
                              ? showMessage(
                                  "please enter your password", context)
                              : showMessage(
                                  "please enter your valid data", context);
                    }
                  },
                  child: Container(
                    child: Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900),
                    )),
                    height: height * 0.08,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        boxShadow: [],
                        gradient: LinearGradient(colors: [
                          Colors.red,
                          Colors.orange,
                          Colors.yellow,
                          Colors.green,
                          Colors.indigo,
                          Colors.purple
                        ])),
                  ),
                ),
                SizedBox(
                  height: 23,
                ),
                InkWell(

                  child: Image.network(
                    'https://loodibee.com/wp-content/uploads/Google-Logo.png',
                    height: 150,
                  ),
                ),
                GestureDetector(

                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            childCurrent: LoginScreen(),
                            alignment: Alignment.center,
                            type: PageTransitionType.bottomToTopJoined,
                            duration: Duration(seconds: 5),
                            child: SignupScreen()));
                  },
                  child: Container(
                    height: height * 0.08,
                    width: width * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30)),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(fontSize: 25),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Color getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

showMessage(String msg, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: getRandomColor(), content: Text(msg)));
}
