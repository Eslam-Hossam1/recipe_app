import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.subTitle,
    this.tralilingIcon,
    this.trailingIconMethod,
  });
  final IconData leadingIcon;
  final String title;
  final String subTitle;
  final IconData? tralilingIcon;
  final void Function()? trailingIconMethod;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          leadingIcon,
        ),
        Expanded(
          child: ListTile(
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.black.withOpacity(.5),
                  fontWeight: FontWeight.w500),
            ),
            subtitle: Text(
              subTitle,
              style: TextStyle(
                fontSize: 19,
                color: Colors.black,
              ),
            ),
          ),
        ),
        if (tralilingIcon != null)
          IconButton(
              onPressed: trailingIconMethod,
              icon: Icon(
                tralilingIcon,
                color: kPrimaryColor,
              )),
      ],
    );
  }
}
