import 'package:chatapp_firebase/constants/colors.dart';
import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/screens/auth/login_page.dart';
import 'package:chatapp_firebase/screens/home_page.dart';
import 'package:chatapp_firebase/services/auth_service.dart';
import 'package:chatapp_firebase/widgets/k_elevated_button..dart';
import 'package:chatapp_firebase/widgets/k_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController fullNameCtrl = TextEditingController();
  AuthService authService = AuthService();
  bool isLoading = false;

//register method
  void register() async {
    try {
      setState(() {
        isLoading = true;
      });

      authService.registerWithEmailAndPassword(
          fullNameCtrl.text, emailCtrl.text, passCtrl.text);

      //save user detials in shared pref
      HelperFunctions.saveUserLoggedInStatus(true);
      HelperFunctions.saveUserNameSF(fullNameCtrl.text);
      HelperFunctions.saveUserEmailSF(emailCtrl.text);

      HelperFunctions.nextScreen(context, const HomePage());
      HelperFunctions.showSnackBar(context, "User registered successfully");
    } catch (e) {
      HelperFunctions.showSnackBar(context, e.toString());
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
                controller: fullNameCtrl,
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
                obscure: true,
              ),
              const SizedBox(height: 16),
              isLoading
                  ? const CircularProgressIndicator()
                  : KElevatedButton(
                      text: 'Register',
                      ontap: () {
                        if (emailCtrl.text.isEmpty &&
                            passCtrl.text.isEmpty &&
                            fullNameCtrl.text.isEmpty) {
                          HelperFunctions.showSnackBar(
                              context, "Please enter all details");
                        } else if (passCtrl.text.length < 6) {
                          HelperFunctions.showSnackBar(context,
                              "Password must be at least 6 characters");
                        } else if (!HelperFunctions.isValidEmail(
                            emailCtrl.text)) {
                          HelperFunctions.showSnackBar(
                              context, "Please enter valid email");
                        } else {
                          register();
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
