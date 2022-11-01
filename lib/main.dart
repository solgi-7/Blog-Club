import 'dart:ui';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/home.dart';
import 'package:blog_club/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primeryTextColor = Color(0xff0D253C);
    const secendryTextColor = Color(0xff2D4379);
    const primeryColor = Color(0xff376AED);
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: FontFamily.avenir,
              ),
            ),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: primeryColor,
          onPrimary: Colors.white,
          onSurface: primeryTextColor,
          onBackground: primeryTextColor,
          background:  Color(0xffFBFCFF),
          surface: Colors.white,
        ),
        textTheme: const TextTheme(
            subtitle1: TextStyle(
              color: secendryTextColor,
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w200,
              fontSize: 18,
            ),
            subtitle2: TextStyle(
              color: primeryTextColor,
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            headline6: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.bold,
              color: primeryTextColor,
              fontSize: 18.0,
            ),
            headline5: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 20,
              color: primeryTextColor,
              fontWeight: FontWeight.w700,
            ),
            headline4: TextStyle(
              fontFamily: FontFamily.avenir,
              fontSize: 24,
              color: primeryTextColor,
              fontWeight: FontWeight.w700,
            ),
            bodyText2: TextStyle(
                fontFamily: FontFamily.avenir,
                color: secendryTextColor,
                fontSize: 12),
            caption: TextStyle(
              fontFamily: FontFamily.avenir,
              fontWeight: FontWeight.w700,
              color: Color(0xff7B8BB2),
              fontSize: 10,
            )),
      ),
      // home: Stack(
      //   children: [
      //     const Positioned.fill(child: HomeScreen()),
      //     Positioned(bottom: 0, right: 0, left: 0, child: _ButtomNavigation()),
      //   ],
      // ),
    home: const SplashScreen(),
    );
  }
}

class _ButtomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 65,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0x009B8487).withOpacity(0.3),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  BottomNavigationItem(activeIconfileName: 'Home.png', iconFileName: 'Home.png', title: 'Home'),
                  BottomNavigationItem(activeIconfileName: 'Articles.png', iconFileName: 'Articles.png', title: 'Articles'),
                  SizedBox(width: 8,),
                  BottomNavigationItem(activeIconfileName: 'Search.png', iconFileName: 'Search.png', title: 'Search'),
                  BottomNavigationItem(activeIconfileName: 'Menu.png', iconFileName: 'Menu.png', title: 'Menu'),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: 65,
              height: 85,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  border: Border.all(color: Colors.white,width: 4.0),
                  color: const Color(0xff376AED),
                ),
                child: Image.asset('assets/img/icons/plus.png'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  const BottomNavigationItem({
    Key? key,
    required this.activeIconfileName,
    required this.iconFileName,
    required this.title,
  }) : super(key: key);
  final String iconFileName;
  final String activeIconfileName;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/img/icons/$iconFileName',
        ),
        const SizedBox(height: 4,),
        Text(
          title,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
