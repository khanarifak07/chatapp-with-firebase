import 'dart:developer';

import 'package:chatapp_firebase/constants/colors.dart';
import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/screens/auth/register_page.dart';
import 'package:chatapp_firebase/widgets/k_elevated_button..dart';
import 'package:chatapp_firebase/widgets/k_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailCtrl = TextEditingController();
    TextEditingController passCtrl = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  "Chatie",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                ),
              ),
              const Text("Login now to see what they are talking!"),
              Image.asset('assets/images/login.jpg'),
              KTextField(
                hintText: "Email",
                prefixIcon: Icons.email,
                controller: emailCtrl,
              ),
              const SizedBox(height: 10),
              KTextField(
                hintText: "Password",
                prefixIcon: Icons.lock,
                controller: passCtrl,
                obscure: true,
              ),
              const SizedBox(height: 16),
              KElevatedButton(
                text: "Login",
                ontap: () {
                  if (emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
                    HelperFunctions.showSnackBar(
                        context, "Please Enter Email and Password");
                  } else if (passCtrl.text.length < 6) {
                    HelperFunctions.showSnackBar(
                        context, "Password must be at least 6 characters");
                  } else if (!HelperFunctions.isValidEmail(emailCtrl.text)) {
                    HelperFunctions.showSnackBar(
                        context, "Please enter valid email");
                  } else {
                    log('Success');
                  }
                },
              ),
              const SizedBox(height: 25),
              RichText(
                  text: TextSpan(
                      text: "Don't have an account ?",
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: "\tRegister Here",
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            HelperFunctions.nextScreenReplace(
                                context, const RegisterPage());
                          })
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
