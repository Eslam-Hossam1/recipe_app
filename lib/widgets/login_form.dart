import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/widgets/custome_elevated_button.dart';
import 'package:recipe_app/widgets/custome_obsecure_text_form_field.dart';
import 'package:recipe_app/widgets/custome_text_form_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late String email;
  late String password;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              addHieghtSpace(8),
              CustomeTextFormField(
                controller: emailController,
                hintText: "Email",
                onSaved: (value) {
                  email = value!;
                },
              ),
              addHieghtSpace(12),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              addHieghtSpace(8),
              CustomeObsecureTextFormField(
                hintText: "Password",
                onSaved: (value) {
                  password = value!;
                },
              ),
              addHieghtSpace(12),
              Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () async {
                      if (emailController.text == '') {
                        log('pls write your email then press forget password nigga');
                        return;
                      }
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text);
                        log("go reset your password nigga");
                      } catch (e) {
                        log("your email doesn't exist nigga");
                      }
                    },
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )),
              addHieghtSpace(12),
              CustomeElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    try {
                      final credential = await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                              email: email, password: password);

                      if (FirebaseAuth.instance.currentUser!.emailVerified) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeView();
                        }));
                      } else {
                        FirebaseAuth.instance.currentUser!
                            .sendEmailVerification();
                        log("pls go verify your email nigga");
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        log('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        log('Wrong password provided for that user.');
                      }
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: "Login",
              )
            ],
          ),
        ));
  }
}
