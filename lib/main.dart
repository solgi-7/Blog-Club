import 'package:blog_club/carousel/carousel_slider.dart';
import 'package:blog_club/data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const defaultfontfamily = 'Avenir';

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const primeryTextColor = Color(0xff0D253C);
    const secendryTextColor = Color(0xff2D4379);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          subtitle1: TextStyle(
            color: secendryTextColor,
            fontFamily: defaultfontfamily,
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
          headline6: TextStyle(
            fontFamily: defaultfontfamily,
            fontWeight: FontWeight.bold,
            color: primeryTextColor,
            fontSize: 18.0,
          ),
          headline4: TextStyle(
            fontFamily: defaultfontfamily,
            fontSize: 24,
            color: primeryTextColor,
            fontWeight: FontWeight.w700,
          ),
          bodyText2: TextStyle(
              fontFamily: defaultfontfamily,
              color: secendryTextColor,
              fontSize: 12),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  // Size? size;
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final stories = AppDatabase.stories;
    // size = MediaQuery.of(context).size;
    // final double height = size!.height;
    // final double width = size!.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hi, Jonathan!',
                      style: themeData.textTheme.subtitle1,
                    ),
                    Image.asset(
                      'assets/img/icons/notification.png',
                      width: 32,
                      height: 32,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 0, 0, 16),
                child: Text(
                  'Explore today’s',
                  style: themeData.textTheme.headline4,
                ),
              ),
              _StoryList(stories: stories),
              const SizedBox(height: 16,),
              _CategoryList()
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = AppDatabase.categories;
    return CarouselSlider.builder(
      itemCount: categories.length,
      itemBuilder: (BuildContext cotnext, int index, realIndex) {
        return _CategoryItem(
          left: realIndex == 0 ? 32 : 8,
          right: realIndex == categories.length-1 ? 32 : 8,
          category: categories[realIndex],
        );
      },
      options: CarouselOptions(
        scrollDirection: Axis.horizontal,
        viewportFraction: 0.8,
        aspectRatio: 1.2,
        initialPage: 0,
        disableCenter: true,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        padEnds: false,
        scrollPhysics: const BouncingScrollPhysics(),
        enlargeStrategy: CenterPageEnlargeStrategy.height,
        // autoPlay: true,
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({Key? key, required this.category,required this.left,required this.right,}) : super(key: key);
  final double right;
  final double left;
  final Category category;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(left, 0, right, 0),
      child: Stack(
        children: [
           Positioned.fill(
            top: 100,
            right: 65,
            left: 65,
            bottom: 24,
              child: Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 20,
                  color: Color(0xff0D253C),
                )
              ],
            ),
          )),

          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.fromLTRB(0,0,0,16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                color: Colors.blue,
              ),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(32),
                  child: Image.asset(
                    'assets/img/posts/large/${category.imageFileName}',
                    fit: BoxFit.cover,
                  )),
              foregroundDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.0),
                gradient: const LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Color(0xff0D253C),
                      Colors.transparent,
                    ]),
              ),
            ),
          ),
         
          Positioned(
            bottom: 48.0,
            left: 32.0,
            child: Text(
              category.title,
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .apply(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _StoryList extends StatelessWidget {
  const _StoryList({
    Key? key,
    required this.stories,
  }) : super(key: key);

  final List<StoryData> stories;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: stories.length,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(23, 0, 23, 0),
          itemBuilder: (BuildContext context, int index) {
            final story = stories[index];
            return _Story(story: story);
          }),
    );
  }
}

class _Story extends StatelessWidget {
  const _Story({
    Key? key,
    required this.story,
  }) : super(key: key);

  final StoryData story;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 0.0),
      child: Column(
        children: [
          Stack(
            children: [
              story.isViewed ? _profileImageViewed() : _profileImageNormal(),
              Positioned(
                bottom: 0,
                right: 0,
                child: Image.asset(
                  'assets/img/icons/${story.iconFileName}',
                  height: 24,
                  width: 24,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(story.name),
        ],
      ),
    );
  }

  Widget _profileImageNormal() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 68,
      height: 68,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xff376AED),
              Color(0xff49B0E2),
              Color(0xff9CECFB),
            ],
          ),
          borderRadius: BorderRadius.circular(24.0)),
      child: Container(
        margin: const EdgeInsets.all(2.0),
        padding: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: Colors.white,
        ),
        child: _profileImage(),
      ),
    );
  }

  Widget _profileImageViewed() {
    return SizedBox(
      height: 68,
      width: 68,
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(24),
        strokeWidth: 2.0,
        color: const Color(0xff7B8BB2),
        padding: const EdgeInsets.all(7.0),
        dashPattern: const [8, 3],
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: 68,
          height: 68,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
          ),
          child: _profileImage(),
        ),
      ),
    );
  }

  Widget _profileImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(17),
      child: Image.asset(
        'assets/img/stories/${story.imageFileName}',
      ),
    );
  }
}
