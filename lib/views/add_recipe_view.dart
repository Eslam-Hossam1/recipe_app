import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/widgets/my_custome_elevated_button.dart';

class AddRecipeView extends StatelessWidget {
  const AddRecipeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 32, left: 12, right: 12),
        child: SingleChildScrollView(
          child: Form(
              child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                  "assets/image.jpg",
                ))),
              ),
              addHieghtSpace(4),
              MyCustomeElevatedButton(
                backgroundColor: Colors.white,
                forgroundColor: kPrimaryColor,
                text: "upload image",
                hieght: 45,
                width: MediaQuery.of(context).size.width * .7,
                onPressed: () {},
              ),
              addHieghtSpace(12),
              CustomeTakeRecipeTextFormField(
                label: "Name",
              ),
              addHieghtSpace(12),
              CustomeTakeRecipeTextFormField(
                label: "Ingredints",
                maxLines: 2,
              ),
              addHieghtSpace(12),
              CustomeTakeRecipeTextFormField(
                label: "Recipe",
                maxLines: 2,
              ),
              addHieghtSpace(24),
              MyCustomeElevatedButton(
                onPressed: () {},
                text: "Confirm",
                hieght: 45,
                width: MediaQuery.of(context).size.width * .7,
              )
            ],
          )),
        ),
      ),
    );
  }
}

class CustomeTakeRecipeTextFormField extends StatelessWidget {
  const CustomeTakeRecipeTextFormField({
    super.key,
    required this.label,
    this.onSaved,
    this.maxLines,
  });
  final String label;
  final void Function(String?)? onSaved;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == '' || value == null) {
          return "this field required";
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: maxLines ?? 1,
      decoration: InputDecoration(
          label: Text(label),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}
