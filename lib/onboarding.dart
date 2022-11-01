import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.colorScheme.background,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32.0,bottom: 8.0),
                  child: Assets.img.background.onboarding.image(),
                ),
              ),
              Container(
                height: 324,
                decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)),
                color: themeData.colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    color: Colors.black.withOpacity(0.1),
                  ),
                ]),
                child: Column(
                  children: [
                    Container(
                      height: 60,
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: (){},
                            child: const Icon(CupertinoIcons.arrow_right),
                            style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all(const Size(84, 60)),
                              shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)))),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
