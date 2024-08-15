import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class HorizontalListTitleRow extends StatelessWidget {
  const HorizontalListTitleRow({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        Text(
          "See All",
          style: TextStyle(
              color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
