import 'package:chatapp_firebase/constants/colors.dart';
import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/screens/auth/register_page.dart';
import 'package:chatapp_firebase/screens/home_page.dart';
import 'package:chatapp_firebase/services/auth_service.dart';
import 'package:chatapp_firebase/widgets/k_elevated_button..dart';
import 'package:chatapp_firebase/widgets/k_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  AuthService authService = AuthService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isLoading = false;

  void login() async {
    try {
      setState(() {
        isLoading = true;
      });
      QuerySnapshot snapshot = await authService.loginWithEmailAndPassword(
          emailCtrl.text, passCtrl.text);
      // Now you can access the user data from the snapshot
      // Example: snapshot.docs.forEach((doc) => print(doc.data()));
      //now I can save the data to shared pref
      HelperFunctions.saveUserLoggedInStatus(true);
      HelperFunctions.saveUserEmailSF(emailCtrl.text);
      HelperFunctions.saveUserNameSF(snapshot.docs[0]['fullName']);
      HelperFunctions.nextScreen(context, const HomePage());
      HelperFunctions.showSnackBar(context, "Login successfully");
    } catch (e) {
      e.toString();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
              isLoading
                  ? const CircularProgressIndicator()
                  : KElevatedButton(
                      text: "Login",
                      ontap: () {
                        if (emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
                          HelperFunctions.showSnackBar(
                              context, "Please Enter Email and Password");
                        } else if (passCtrl.text.length < 6) {
                          HelperFunctions.showSnackBar(context,
                              "Password must be at least 6 characters");
                        } else if (!HelperFunctions.isValidEmail(
                            emailCtrl.text)) {
                          HelperFunctions.showSnackBar(
                              context, "Please enter valid email");
                        } else {
                          login();
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
