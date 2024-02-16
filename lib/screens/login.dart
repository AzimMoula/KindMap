// ignore: unused_import
// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unused_local_variable, unrelated_type_equality_checks, use_build_context_synchronously

import "package:firebase_auth/firebase_auth.dart";
import "package:flutter/cupertino.dart";
// import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:kindmap/screens/home.dart";
import "package:kindmap/screens/register.dart";
import "package:kindmap/widgets/custom_text_input.dart";

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final auth = FirebaseAuth.instance;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const Center(
              child: Text(
                "Sign-in Screen",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextInput(
              controller: _email,
              icon: const Icon(Icons.email),
              isObscure: false,
              hint: "Enter Email here",
              keyboard: TextInputType.emailAddress,
            ),
            CustomTextInput(
              controller: _password,
              icon: const Icon(Icons.password),
              isObscure: true,
              hint: "Enter Password here",
              keyboard: TextInputType.visiblePassword,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  onPressed: () async {
                    // * Authenticate user and Navigate to home
                    final String email = _email.text;
                    final String password = _password.text;
                    await auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    // const Center(child: Text("Email or Password is invalid"));
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => const Home()));
                    // Navigator.pushNamed(context, '/home');
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Sign-in",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  )),
            ),
            TextButton(
                onPressed: () {
                  // * Navigate to Register Screen
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const Register()));
                  // Navigator.pushNamed(context, '/register');
                },
                child: const Text("Register here")),
          ],
        ),
      ),
    );
  }
}
