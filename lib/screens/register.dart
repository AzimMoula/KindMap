// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kindmap/screens/home.dart';
import 'package:kindmap/widgets/custom_text_input.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final auth = FirebaseAuth.instance;
    final userID = auth.currentUser?.uid;
    final db = FirebaseFirestore.instance;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Register here"),
          centerTitle: true,
          leading: IconButton(
              tooltip: 'Go Back',
              onPressed: () {
                // * Navigate back to sign-in page
                // Navigator.pushNamed(context, '/home');
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        body: Column(
          children: [
            CustomTextInput(
                controller: _name,
                icon: const Icon(Icons.person),
                isObscure: false,
                keyboard: TextInputType.name,
                hint: "Enter your Name"),
            CustomTextInput(
                controller: _email,
                icon: const Icon(Icons.email),
                isObscure: false,
                keyboard: TextInputType.emailAddress,
                hint: "Enter your Email"),
            CustomTextInput(
                controller: _password,
                icon: const Icon(Icons.password),
                isObscure: true,
                keyboard: TextInputType.visiblePassword,
                hint: "Enter your Password"),
            ElevatedButton(
                onPressed: () async {
                  // * Register user and Navigate to home page
                  final String name = _name.text;
                  final String email = _email.text;
                  final String password = _password.text;
                  // final docRef =
                  //     db.collection('App').doc('info').collection(userID!);
                  // if(email!=null)
                  final info = {
                    'Name': name,
                    'Email': email,
                  };
                  // await docRef.add(info);
                  auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => const Home()));
                  // Navigator.pushNamed(context, '/home');
                },
                child: const Text("Register"))
          ],
        ),
      ),
    );
  }
}
