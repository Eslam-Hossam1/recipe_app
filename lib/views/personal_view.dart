import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:recipe_app/helper/add_space.dart';

class PersonalView extends StatelessWidget {
  const PersonalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            scrolledUnderElevation: 0,
            shadowColor: Colors.transparent,
            elevation: 0,
            backgroundColor: Colors.transparent,
            floating: true,
            leading: IconButton(
                style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.white.withOpacity(.5)),
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/shrimp_sushi_bowls.jpeg"),
                  radius: 70,
                ),
                addHieghtSpace(12),
                Text(
                  "Eslam Hossam",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                addHieghtSpace(12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomeFollowersCol(
                      subject: "Following",
                      subjectNumber: 23,
                    ),
                    CustomeFollowersCol(
                      subject: "Followers",
                      subjectNumber: 8,
                    ),
                    CustomeFollowersCol(
                      subject: "Recipes",
                      subjectNumber: 12,
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black.withOpacity(.2),
                  endIndent: 24,
                  indent: 24,
                ),
              ],
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 280,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12),
              itemBuilder: (context, index) {
                return CustomeProfileRecipeItem();
              },
            ),
          )
        ],
      ),
    );
  }
}

class CustomeProfileRecipeItem extends StatelessWidget {
  const CustomeProfileRecipeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
            offset: Offset(1, 0),
            blurRadius: 10,
          )
        ],
      ),
      height: MediaQuery.of(context).size.height * .39,
      width: MediaQuery.of(context).size.width * .45,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/img_getstarted.png"))),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.black.withOpacity(.5)),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 15,
                              backgroundImage: AssetImage(
                                  "assets/grilled_thai_red_curry_shrimp.jpeg"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                "Publisher",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            addHieghtSpace(8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "shrimp suchi bowl",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  addHieghtSpace(8),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "shrimp sucjfkasdj;klfjklasjfkljas;klfjkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkasjf;kljaskfjklsjkfjkljfjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjhi bowl",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomeFollowersCol extends StatelessWidget {
  const CustomeFollowersCol({
    super.key,
    required this.subject,
    required this.subjectNumber,
  });
  final String subject;
  final int subjectNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          subject,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          subjectNumber.toString(),
          style: TextStyle(
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
