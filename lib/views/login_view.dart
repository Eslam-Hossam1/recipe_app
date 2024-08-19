import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:recipe_app/cubits/auth_cubits/login_cubit/login_cubit.dart';
import 'package:recipe_app/cubits/auth_cubits/login_cubit/login_states.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/views/signup_view.dart';
import 'package:recipe_app/widgets/login_form.dart';
import 'package:recipe_app/widgets/svg_elevated_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  // Future<void> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //   if (googleUser == null) {
  //     return;
  //   }
  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   await FirebaseAuth.instance.signInWithCredential(credential);
  //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
  //     return const HomeView();
  //   }));
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) async {
      if (state is LoginFailureState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          title: 'Warning',
          desc: state.errMsg,
          btnOkOnPress: () {},
        ).show();
      } else if (state is LoginSuccessState) {
        if (FirebaseAuth.instance.currentUser!.emailVerified) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return const HomeView();
          }));
        } else {
          await BlocProvider.of<LoginCubit>(context).sendEmailVerification();
        }
      } else if (state is SendVerificationState) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.info,
          animType: AnimType.rightSlide,
          title: 'Warning',
          desc: 'please go verify your email before log in',
          btnOkOnPress: () {},
        ).show();
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is LoginLoadingState,
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
                  "Login",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "Login to continue using the app",
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ),
              addHieghtSpace(8),
              LoginForm(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      endIndent: 10,
                    )),
                    Text("Or Login With"),
                    Expanded(
                        child: Divider(
                      indent: 10,
                    ))
                  ],
                ),
              ),
              addHieghtSpace(12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgElevatedButton(
                    svgImagePath: "assets/icons8-facebook.svg",
                    color: Colors.blue,
                  ),
                  SvgElevatedButton(
                    onPressed: () async {
                      //        await signInWithGoogle();
                    },
                    svgImagePath: "assets/icons8-google.svg",
                  ),
                  SvgElevatedButton(
                    svgImagePath: "assets/icons8-apple.svg",
                  ),
                ],
              ),
              addHieghtSpace(24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return SignupView();
                      }));
                    },
                    child: Text(
                      "Register",
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
