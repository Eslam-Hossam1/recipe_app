import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/views/home_view.dart';
import 'package:recipe_app/widgets/custome_elevated_button.dart';
import 'package:recipe_app/widgets/custome_text_form_field.dart';
import 'package:recipe_app/widgets/forgot_password_form.dart';

class UsernamePhotoView extends StatefulWidget {
  const UsernamePhotoView({super.key});

  @override
  State<UsernamePhotoView> createState() => _UsernamePhotoViewState();
}

class _UsernamePhotoViewState extends State<UsernamePhotoView> {
  late String username;
  File? file;
  String? imageUrl;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  CollectionReference usersCollection =
      FirebaseFirestore.instance.collection("Users");
  Future<void> uplodeUserData(
      String userId, String username, String imageUrl) async {
    usersCollection.add({
      "userId": userId,
      "username": username,
      "imageUrl": imageUrl,
      "savedRecipes": [],
      "followers": [],
      "followingUsers": [],
      "userRecipes": [],
    });
  }

  Future<void> uploadimage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? cameraImage =
        await picker.pickImage(source: ImageSource.camera);
    if (cameraImage != null) {
      var imageName = basename(cameraImage.path);
      file = File(cameraImage.path);
      setState(() {});
      var storageRef = FirebaseStorage.instance.ref("images/$imageName");
      await storageRef.putFile(file!);
      imageUrl = await storageRef.getDownloadURL();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: (file != null && imageUrl == null)
                ? CircularProgressIndicator()
                : Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: file == null
                            ? AssetImage("assets/download.png")
                            : FileImage(file!),
                        radius: 70,
                      ),
                      Positioned(
                        bottom: 8,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          child: IconButton(
                            onPressed: () async {
                              await uploadimage();
                            },
                            icon: Icon(
                              Icons.edit,
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
              "Edit your profile info",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              "this info that  other users can see",
              style: TextStyle(color: Colors.grey.shade500),
            ),
          ),
          addHieghtSpace(8),
          Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "username",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    addHieghtSpace(8),
                    CustomeTextFormField(
                      hintText: "username",
                      onSaved: (value) {
                        username = value!;
                      },
                    ),
                    addHieghtSpace(12),
                    CustomeElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          if (file == null) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'Warning',
                              desc: 'you should upload photo first',
                              btnOkOnPress: () {},
                            ).show();
                          } else if (file != null && imageUrl == null) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.info,
                              animType: AnimType.rightSlide,
                              title: 'Warning',
                              desc:
                                  'we saving your image try again after few seconds',
                              btnOkOnPress: () {},
                            ).show();
                          } else {
                            uplodeUserData(
                                    FirebaseAuth.instance.currentUser!.uid,
                                    username,
                                    imageUrl!)
                                .then((e) {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return HomeView();
                              }));
                            });
                          }
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
              ))
        ],
      ),
    );
  }
}
