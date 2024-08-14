import 'dart:ui';

import 'package:flutter/material.dart';

class HorizontalRecipeItem extends StatelessWidget {
  const HorizontalRecipeItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * .3,
          width: MediaQuery.of(context).size.width * .4,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/shrimp_sushi_bowls.jpeg"))),
        ),
        Positioned(
            left: 6,
            top: 6,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(.5)),
                  child: Text(
                    "Seafood",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )),
        Positioned(
            bottom: 8,
            left: 4,
            right: 4,
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.black.withOpacity(.5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          "suchi shrimp bowls",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 16),
                        ),
                      ),
                      Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
