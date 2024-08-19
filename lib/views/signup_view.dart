import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipe_app/cubits/auth_cubits/signup_cubit/signup_cubit.dart';
import 'package:recipe_app/cubits/auth_cubits/signup_cubit/signup_states.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/views/login_view.dart';
import 'package:recipe_app/widgets/signup_form.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpStates>(listener: (context, state) {
      if (state is SignUpFailureState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Warning',
          desc: state.errMsg,
          btnOkOnPress: () {},
        ).show();
      } else if (state is SignUpSuccessState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Warning',
          desc: 'please go verify your email before log in',
          dismissOnTouchOutside: false,
          dismissOnBackKeyPress: false,
          btnOkOnPress: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const LoginView();
            }));
          },
        ).show();
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is SignUpLoadingState,
        child: Scaffold(
          body: ListView(
            children: [
              addHieghtSpace(32),
              Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade300, shape: BoxShape.circle),
                  child: Image.asset(
                    "assets/icons8-buying-48.png",
                  )),
              addHieghtSpace(8),
              ListTile(
                title: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Sign Up to continue using the app",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              addHieghtSpace(8),
              SignupForm(),
              addHieghtSpace(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginView();
                      }));
                    },
                    child: Text(
                      "Log in",
                      style: TextStyle(color: Colors.blue),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
