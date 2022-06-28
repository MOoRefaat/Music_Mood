import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:music_mood/Register_Screen/register_screen.dart';
import '../components/components.dart';

class RecoverScreen extends StatelessWidget {
  //const LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();

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
                  'Recovery!',
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
                    'Your password will be sent to your email!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Work Sans',
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 169,
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
                      if (formKey.currentState!.validate()) ;
                    },
                    child: Text(
                      'Send',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: HexColor('#7D4EFF'),
                    padding:
                        EdgeInsets.symmetric(horizontal: 127.5, vertical: 16),
                    //  clipBehavior: Clip.antiAliasWithSaveLayer,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
