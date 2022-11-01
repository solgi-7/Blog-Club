import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/onboarding.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4)).then((value) => 
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => const OnBoardingScreen()),),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Assets.img.background.splash.image(fit: BoxFit.cover),
            ),
            Center(
              child: Assets.img.icons.logo.svg(width: 100),
            )
        ],
      ),
    );
  }
}