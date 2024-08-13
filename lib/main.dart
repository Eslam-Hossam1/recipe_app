import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/views/onboarding_view.dart';

void main() {
  runApp(const RecipeApp());
}

class RecipeApp extends StatelessWidget {
  const RecipeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor)),
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
