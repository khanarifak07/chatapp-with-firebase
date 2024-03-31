import 'dart:developer';

import 'package:chatapp_firebase/constants/colors.dart';
import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/screens/auth/login_page.dart';
import 'package:chatapp_firebase/widgets/k_elevated_button..dart';
import 'package:chatapp_firebase/widgets/k_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                padding: EdgeInsets.only(top: 80.0),
                child: Text(
                  "Chatie",
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
                ),
              ),
              const Text("Create an account to chat and explore!"),
              Image.asset('assets/images/register.jpg'),
              KTextField(
                hintText: "Full Name",
                prefixIcon: Icons.person,
                controller: emailCtrl,
              ),
              const SizedBox(height: 10),
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
              ),
              const SizedBox(height: 16),
              KElevatedButton(
                text: "Register",
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
                      text: "Already have an account ?",
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: "\tLogin Here",
                        style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            HelperFunctions.nextScreenReplace(
                                context, const LoginPage());
                          })
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
