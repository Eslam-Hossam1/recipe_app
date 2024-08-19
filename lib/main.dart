import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/cubits/auth_cubits/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:recipe_app/cubits/auth_cubits/login_cubit/login_cubit.dart';
import 'package:recipe_app/cubits/auth_cubits/signup_cubit/signup_cubit.dart';
import 'package:recipe_app/firebase_options.dart';
import 'package:recipe_app/views/add_recipe_view.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/views/login_view.dart';
import 'package:recipe_app/views/onboarding_view.dart';
import 'package:recipe_app/views/personal_view.dart';
import 'package:recipe_app/views/profile_details_view.dart';
import 'package:recipe_app/views/recipe_details_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.signOut();
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => SignUpCubit()),
        BlocProvider(create: (context) => ForgotPasswordCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor)),
        debugShowCheckedModeBanner: false,
        home: (FirebaseAuth.instance.currentUser != null &&
                FirebaseAuth.instance.currentUser!.emailVerified)
            ? HomeView()
            : LoginView(),
      ),
    );
  }
}
