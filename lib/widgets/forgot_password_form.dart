import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/cubits/auth_cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:recipe_app/cubits/auth_cubits/forgot_password_cubit/forgot_password_states.dart';
import 'package:recipe_app/cubits/auth_cubits/login_cubit/login_cubit.dart';
import 'package:recipe_app/cubits/auth_cubits/login_cubit/login_states.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/widgets/custome_elevated_button.dart';
import 'package:recipe_app/widgets/custome_obsecure_text_form_field.dart';
import 'package:recipe_app/widgets/custome_text_form_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  late String email;
  late String password;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordStates>(
        builder: (context, state) {
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
                CustomeElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      await BlocProvider.of<ForgotPasswordCubit>(context)
                          .sendPasswordResetEmail(email);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  },
                  text: "Submit",
                )
              ],
            ),
          ));
    });
  }
}
