import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/local_variable.dart';
import '../../home/screens/home_screen.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController =TextEditingController();
  TextEditingController passwordController =TextEditingController();
  bool passwordVisibility = true;
  final formKey=GlobalKey<FormState>();
  final passwordValidation=RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
  var file;
  pickFile(ImageSource)async{
    final imgFile = await ImagePicker().pickImage(source: ImageSource);
    if(mounted){
      setState(() {
        file =File(imgFile!.path);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage('https://media.tenor.com/twhLs21u8kMAAAAM/flower.gif'),fit: BoxFit.cover)),
        child: Center(
          child: Padding(
            padding:  EdgeInsets.all(width*0.05),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      file!=null?
                      CircleAvatar(
                        radius: width*0.2,
                        backgroundColor: Colors.blue[300],
                        backgroundImage: FileImage(file),
                      )
                          : CircleAvatar(
                        radius: width*0.2,
                        backgroundColor: Colors.blue[300],
                      ),
                      SizedBox(
                        height: height*0.17,
                        width: width*0.35,
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              pickFile(ImageSource.gallery);
                            },
                            child: Icon(Icons.edit,color: Colors.purple,size: width*0.08,
                            ),
                          ),
                        ),
                      )
                ],
              ),
                  TextFormField(
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
                  TextFormField(
                    controller: passwordController,
                    obscureText: passwordVisibility,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!passwordValidation.hasMatch(value!)){
                        return "enter a valid password";
                      }
                      else{
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
                              setState(() {

                              });
                            }, icon: passwordVisibility ? Icon(CupertinoIcons.eye):Icon(CupertinoIcons.eye_slash)),
                        labelText: "Password",
                        hintText: "Please enter your password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.blue)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Colors.purple))),
                  ),
                  GestureDetector(
                      onTap: () {
                        if(nameController.text!=""&&
                passwordController.text!="" &&
                formKey.currentState!.validate()){
              Navigator.push(context,     PageTransition(
                  childCurrent: SignupScreen(),
                  alignment: Alignment.center,
                  type: PageTransitionType.rightToLeftJoined,
                  duration: Duration(seconds: 1),
                  child: HomeScreen()));
              showMessage("Submitted Successfully",context);
                        }
                        else{
              nameController.text==""?showMessage("please enter your username",context):
              passwordController.text==""?showMessage("please enter your password",context):
              showMessage("please enter your valid data",context);
                        }
                      },
                    child: Container(
                      child: Center(child: Text("Register",style: TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900
                      ),)),
                      height: height*0.08,
                      width: width*0.85,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30),topRight: Radius.circular(30)),
                          color: Colors.blue[300]
                      ),
                    ),
                  ),
                  ]
                    ),
            ),
          ),
        ),
      )
    );
  }
}
