import 'package:flutter/material.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/helper/add_space.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .7,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.red,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/img_getstarted.png"))),
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.transparent, Colors.black],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spacer(),
                Text(
                  'Cooking & \nDelicious Food Easily',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                addHieghtSpace(8),
                Text(
                  'Discover food a lot of  recipes in your hands and cooking it easily!',
                  style: TextStyle(color: Colors.white38, fontSize: 16),
                ),
                addHieghtSpace(16),
                Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
                      child: ElevatedButton(
                          style: ButtonStyle(
                              minimumSize: WidgetStatePropertyAll(
                                  Size(MediaQuery.of(context).size.width, 50)),
                              backgroundColor:
                                  WidgetStatePropertyAll(kPrimaryColor)),
                          onPressed: () {},
                          child: Text(
                            "Get Started",
                            style: TextStyle(color: Colors.white),
                          )),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }
}
