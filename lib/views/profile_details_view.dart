import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/widgets/profile_list_tile.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 12.0, right: 12, left: 12),
          child: Column(
            children: [
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
              addHieghtSpace(12),
              ProfileListTile(
                leadingIcon: Icons.edit,
                title: "Name",
                subTitle: "Eslam Hossam",
                tralilingIcon: Icons.edit,
              ),
              Divider(),
              ProfileListTile(
                leadingIcon: Icons.email,
                title: "Email",
                subTitle: "eslamhossam.tech@gmail.com",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
