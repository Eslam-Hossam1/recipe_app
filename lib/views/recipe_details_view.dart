import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:background_app_bar/background_app_bar.dart';

class RecipeDetailsView extends StatefulWidget {
  const RecipeDetailsView({super.key});

  @override
  State<RecipeDetailsView> createState() => _RecipeDetailsViewState();
}

class _RecipeDetailsViewState extends State<RecipeDetailsView> {
  bool x = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: innerBoxIsScrolled
                    ? Text(
                        overflow: TextOverflow.ellipsis,
                        "shrimb suchi bowl",
                        style: TextStyle(color: Colors.white),
                      )
                    : Text(""),
                expandedHeight: 250,
                pinned: true,
                floating: false,
                leading: IconButton(
                    style: IconButton.styleFrom(
                        fixedSize: Size(20, 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        backgroundColor: Colors.black.withOpacity(.5)),
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    )),
                actions: [
                  IconButton(
                      style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          backgroundColor: Colors.black.withOpacity(.5)),
                      onPressed: () {},
                      icon: Icon(
                        Icons.notifications_none_rounded,
                        color: Colors.white,
                      )),
                ],
                flexibleSpace: BackgroundFlexibleSpaceBar(
                  // title: Text(
                  //   "shrimb suchi bowl",
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  // ),
                  background: Image.asset(
                    "assets/shrimp_sushi_bowls.jpeg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addHieghtSpace(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Icon(Icons.favorite_border_rounded),
                      )
                    ],
                  ),
                  Center(
                    child: Text(
                      "shrimb suchi bowl",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  addHieghtSpace(12),
                  Text(
                    "Ingredients:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "jkfa;jskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  addHieghtSpace(12),
                  Divider(),
                  addHieghtSpace(12),
                  Text(
                    "Recipe:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "jkfa;jskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjskfjkasjfkljskfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  addHieghtSpace(0)
                ],
              ),
            ),
          )),
    );
  }
}
