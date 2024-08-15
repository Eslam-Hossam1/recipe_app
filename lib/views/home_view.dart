import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/add_space.dart';
import 'package:recipe_app/widgets/home_search_bar.dart';
import 'package:recipe_app/widgets/horizontal_list_title_row.dart';
import 'package:recipe_app/widgets/horizontal_list_view.dart';
import 'package:recipe_app/widgets/horizontal_recipe_item.dart';
import 'package:recipe_app/widgets/vertical_recipe_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).padding.bottom,
        ),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "Hello Eslam,",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  "What you want to cook today ?",
                  style: TextStyle(
                      color: Colors.black54, fontWeight: FontWeight.normal),
                ),
              ),
            ),
            SliverToBoxAdapter(child: addHieghtSpace(12)),
            SliverToBoxAdapter(child: HomeSearchBar()),
            SliverToBoxAdapter(child: addHieghtSpace(12)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: HorizontalListTitleRow(
                      title: "Trending Recipes",
                    ),
                  ),
                  addHieghtSpace(12),
                  HorizontalListView()
                ],
              ),
            ),
            SliverToBoxAdapter(child: addHieghtSpace(12)),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                    child: HorizontalListTitleRow(
                      title: "Latest Recipes",
                    ),
                  ),
                  addHieghtSpace(12),
                  HorizontalListView()
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: addHieghtSpace(12),
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: Text(
                    "Discover",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            SliverList.builder(
              itemBuilder: (context, index) {
                return VerticalRecipeItem();
              },
            )
          ],
        ),
      ),
    );
  }
}
