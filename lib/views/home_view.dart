import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/widgets/horizontal_recipe_item.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello Eslam,",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "What you want to cook today ?",
                style: TextStyle(
                    color: Colors.black54, fontWeight: FontWeight.normal),
              ),
              addHieghtSpace(12),
              Container(
                margin: EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Color(0xffECECEC),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                        top: 12,
                      ),
                      hintText: "Search Recipes",
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black,
                      )),
                ),
              ),
              addHieghtSpace(12),
              Padding(
                padding: EdgeInsets.only(right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Trending Recipes",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              addHieghtSpace(12),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HorizontalRecipeItem();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 10),
              ),
              addHieghtSpace(12),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Recipes",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              addHieghtSpace(12),
              SizedBox(
                height: MediaQuery.of(context).size.height * .3,
                child: ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return HorizontalRecipeItem();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: 10,
                      );
                    },
                    itemCount: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
