import 'dart:ui';
import 'package:blog_club/article.dart';
import 'package:blog_club/gen/fonts.gen.dart';
import 'package:blog_club/home.dart';
import 'package:blog_club/profile.dart';
import 'package:blog_club/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
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
          background: Color(0xffFBFCFF),
          surface: Colors.white,
        ),
        appBarTheme: const AppBarTheme(
          titleSpacing: 32.0,
          backgroundColor: Colors.white,
          foregroundColor: primeryTextColor,
        ),
        snackBarTheme: const SnackBarThemeData(
          backgroundColor: primeryColor,
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
            bodyText1: TextStyle(
                fontFamily: FontFamily.avenir,
                color: primeryTextColor,
                fontSize: 14),
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
      home: const MainScreen(),
    );
  }
}

class SimpleScreen extends StatelessWidget {
  const SimpleScreen({
    Key? key,
    required this.tabName,
    this.screenNumber = 1,
  }) : super(key: key);
  final String tabName;
  final int screenNumber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Tab: $tabName, Screen #$screenNumber',
              style: Theme.of(context).textTheme.headline6,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => SimpleScreen(
                        tabName: tabName,
                        screenNumber: screenNumber + 1,
                      ),
                    ),
                  );
                },
                child: const Text('Click Me....!'))
          ],
        ),
      ),
    ));
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

const int homeIndex = 0;
const int articleIndex = 1;
const int searchIndex = 2;
const int menuIndex = 3;
const double bottomNavigationHeight = 65;

class _MainScreenState extends State<MainScreen> {
  int selectedScreenIndex = homeIndex;
  final List<int> _history = [];

  GlobalKey<NavigatorState> _homeKey = GlobalKey();
  GlobalKey<NavigatorState> _articleKey = GlobalKey();
  GlobalKey<NavigatorState> _searchKey = GlobalKey();
  GlobalKey<NavigatorState> _menuKey = GlobalKey();

  late final map = {
    homeIndex: _homeKey,
    articleIndex: _articleKey,
    searchIndex: _searchKey,
    menuIndex: _menuKey,
  };

  Future<bool> _onwillPop() async {
    // if(_homeKey.currentState!.canPop()){
    //   _homeKey.currentState!.pop();
    // }
    final NavigatorState currentSelectedTabNavigatorState =
        map[selectedScreenIndex]!.currentState!;
    if (currentSelectedTabNavigatorState.canPop()) {
      currentSelectedTabNavigatorState.pop();
      return false;
    } else if (_history.isNotEmpty) {
      setState(() {
        selectedScreenIndex = _history.last;
        _history.removeLast();
      });
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onwillPop,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: selectedScreenIndex,
                children: [
                  _navigator(
                    child: const HomeScreen(),
                    key: _homeKey,
                    index: homeIndex,
                  ),
                  _navigator(
                    child: const ArticleScreen(),
                    key: _articleKey,
                    index: articleIndex,
                  ),
                  _navigator(
                    child: const SimpleScreen(tabName: 'Search'),
                    key: _searchKey,
                    index: searchIndex,
                  ),
                  _navigator(
                    child: const ProfileScreen(),
                    key: _menuKey,
                    index: menuIndex,
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: _ButtomNavigation(
                selectedIndex: selectedScreenIndex,
                onTab: (index) {
                  setState(() {
                    _history.remove(selectedScreenIndex);
                    _history.add(selectedScreenIndex);
                    selectedScreenIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navigator(
      {required GlobalKey key, required int index, required Widget child}) {
    return key.currentState == null && selectedScreenIndex != index
        ? const SizedBox()
        : Navigator(
            key: key,
            onGenerateRoute: (settings) => MaterialPageRoute(
              builder: (context) => Offstage(
                offstage: selectedScreenIndex != index,
                child: child,
              ),
            ),
          );
  }
}

class _ButtomNavigation extends StatelessWidget {
  final Function(int index) onTab;
  final int selectedIndex;
  const _ButtomNavigation({required this.onTab, required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: Stack(
        children: [
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: const Color(0x009B8487).withOpacity(0.3),
                ),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BottomNavigationItem(
                    isActive: selectedIndex == homeIndex,
                    activeIconfileName: 'HomeActive.png',
                    iconFileName: 'Home.png',
                    title: 'Home',
                    onTap: () {
                      onTab(homeIndex);
                    },
                  ),
                  BottomNavigationItem(
                    isActive: selectedIndex == articleIndex,
                    activeIconfileName: 'ArticlesActive.png',
                    iconFileName: 'Articles.png',
                    title: 'Articles',
                    onTap: () {
                      onTab(articleIndex);
                    },
                  ),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  BottomNavigationItem(
                    isActive: selectedIndex == searchIndex,
                    activeIconfileName: 'SearchActive.png',
                    iconFileName: 'Search.png',
                    title: 'Search',
                    onTap: () {
                      onTab(searchIndex);
                    },
                  ),
                  BottomNavigationItem(
                    isActive: selectedIndex == menuIndex,
                    activeIconfileName: 'MenuActive.png',
                    iconFileName: 'Menu.png',
                    title: 'Menu',
                    onTap: () {
                      onTab(menuIndex);
                    },
                  ),
                ],
              ),
            ),
          ),
          Center(
            child: Container(
              alignment: Alignment.topCenter,
              width: 65,
              height: bottomNavigationHeight,
              child: Container(
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.5),
                  border: Border.all(color: Colors.white, width: 4.0),
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
    required this.isActive,
    required this.onTap,
  }) : super(key: key);
  final String iconFileName;
  final String activeIconfileName;
  final Function() onTap;
  final bool isActive;
  final String title;
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/icons/${isActive ? activeIconfileName : iconFileName}',
              width: 24,
              height: 24,
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              title,
              style: themeData.textTheme.caption!.apply(
                color: isActive
                    ? themeData.colorScheme.primary
                    : themeData.textTheme.caption!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
