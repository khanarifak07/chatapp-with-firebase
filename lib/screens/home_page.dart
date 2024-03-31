import 'package:chatapp_firebase/helper/helper_function.dart';
import 'package:chatapp_firebase/screens/auth/login_page.dart';
import 'package:chatapp_firebase/services/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();

    void logout() {
      authService.signOut();
      //make saveUserLoggedInStatus as false and clear the saved data in SF
      HelperFunctions.saveUserLoggedInStatus(false);
      HelperFunctions.saveUserEmailSF("");
      HelperFunctions.saveUserNameSF("");
      HelperFunctions.nextScreenReplace(context, const LoginPage());
    }

    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () {
          //logout
          logout();
        },
        child: const Text("Logout"),
      ),
    ));
  }
}
