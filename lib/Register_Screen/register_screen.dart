import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:music_mood/Login_Screen/login_screen.dart';

import '../HomeLayout_Screen/homeLayout_screen.dart';
import '../components/components.dart';

class RegisterScreen extends StatelessWidget {
  //const LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var nameController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 135),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register Now!',
                  style: TextStyle(
                      fontFamily: 'Work Sans',
                      fontWeight: FontWeight.w800,
                      fontSize: 48),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  // width: 213,
                  // height: 46,
                  child: Text(
                    'Create an account and let the fun begins!!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 70,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Your Name';
                    }
                  },
                  controller: nameController,
                  // obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter An Email Address';
                    }
                  },
                  controller: emailController,
                  // obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Email Adress',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // keyboardType: TextInputType.emailAddress,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Password';
                    }
                  },
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    //fillColor: HexColor('#536DFE'),
                    // hoverColor: HexColor('#536DFE'),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.visibility_off_outlined),
                    ),
                    prefixIcon: Icon(Icons.lock),
                    //  suffixIcon: Icon(Icons.remove_red_eye),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    //color: HexColor('#536DFE'),
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  child: MaterialButton(
                    //colorBrightness: Brightness.dark,
                    height: 58,
                    onPressed: () {
                      if (formKey.currentState!.validate())
                        navigateTo(context, HomeLayoutScreen());
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: HexColor('#7D4EFF'),
                    padding: EdgeInsets.symmetric(horizontal: 72, vertical: 16),
                    //  clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ),
                SizedBox(
                  height: 72,
                ),
                Text(
                  'Continue with ..',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.facebook_outlined),
                        iconSize: 40,
                        color: Colors.blue,
                      ),
                      SizedBox(
                        width: 65,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.apple_outlined),
                        iconSize: 40,
                      ),
                      SizedBox(
                        width: 65,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have An Account,'),
                    TextButton(
                        onPressed: () {
                          navigateTo(context, LoginScreen());
                        },
                        child: Text('Login Now')),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
