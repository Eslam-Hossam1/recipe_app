import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/cubits/auth_cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:recipe_app/cubits/auth_cubits/forgot_password_cubit/forgot_password_states.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/views/signup_view.dart';
import 'package:recipe_app/widgets/forgot_password_form.dart';
import 'package:recipe_app/widgets/login_form.dart';
import 'package:recipe_app/widgets/svg_elevated_button.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ForgotPasswordCubit, ForgotPasswordStates>(
        listener: (context, state) async {
      if (state is ForgotPasswordFailureState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Warning',
          desc: state.errMsg,
          btnOkOnPress: () {},
        ).show();
      } else if (state is ForgotPasswordSuccessState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Warning',
          desc: 'we sent to  your email a link to reset your password',
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          btnOkOnPress: () {
            Navigator.pop(context);
          },
        ).show();
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is ForgotPasswordLoadingState,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
          ),
          body: ListView(
            children: [
              addHieghtSpace(32),
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/shrimp_sushi_bowls.jpeg"),
                      radius: 70,
                    ),
                    Positioned(
                      bottom: 8,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: kPrimaryColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              addHieghtSpace(8),
              ListTile(
                title: Text(
                  "Enter your username and profile photo",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "this informations that will other users see",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              addHieghtSpace(8),
              ForgotPasswordForm()
            ],
          ),
        ),
      );
    });
  }
}
