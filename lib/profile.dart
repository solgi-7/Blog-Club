import 'package:blog_club/data.dart';
import 'package:blog_club/gen/assets.gen.dart';
import 'package:blog_club/home.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final posts = AppDatabase.posts;
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBar(
              backgroundColor: themeData.colorScheme.background.withOpacity(0.0),
              title: const Text('Profile'),
              elevation: 0.0,
              actions: [
                IconButton(
                    onPressed: () {}, icon: const Icon(Icons.more_horiz_rounded)),
                const SizedBox(
                  width: 16.0,
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(32.0, 0, 32.0, 64.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      color: themeData.colorScheme.surface,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          color:
                              themeData.colorScheme.onBackground.withOpacity(0.1),
                        )
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Row(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Assets.img.stories.story8
                                    .image(width: 84, height: 84)),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('@joviedan'),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    'Jovi Daniel',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16.0),
                                  ),
                                  const SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'UX Designer',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .apply(
                                            color: themeData.colorScheme.primary),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 32.0),
                        child: Text(
                          'About me',
                          style: themeData.textTheme.headline6,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(32.0, 4.0, 32.0, 32.0),
                        child: Text(
                          'Madison Blackstone is a director of user experience design, with experience managing global teams.',
                          style: themeData.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.w200),
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 32.0,
                    left: 96.0,
                    right: 96.0,
                    child: Container(
                      height: 32.0,
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                          blurRadius: 20.0,
                          color: themeData.colorScheme.onBackground
                              .withOpacity(0.85),
                        )
                      ]),
                    )),
                Positioned(
                  bottom: 32.0,
                  right: 64.0,
                  left: 64.0,
                  child: Container(
                    height: 68.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: themeData.colorScheme.primary,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: const Color(0xff2151CD)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '52',
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    color: themeData.colorScheme.onPrimary,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  'Post',
                                  style: themeData.textTheme.bodyText1!.copyWith(
                                      color: themeData.colorScheme.onPrimary,
                                      fontWeight: FontWeight.w200),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '250',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                'Flowing',
                                style: themeData.textTheme.bodyText1!.copyWith(
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '4.5K',
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: themeData.colorScheme.onPrimary,
                                ),
                              ),
                              const SizedBox(
                                height: 4.0,
                              ),
                              Text(
                                'Followers',
                                style: themeData.textTheme.bodyText1!.copyWith(
                                    color: themeData.colorScheme.onPrimary,
                                    fontWeight: FontWeight.w200),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32.0),
                  topRight: Radius.circular(32.0),
                ),
                color: themeData.colorScheme.surface,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32.0, vertical: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Text(
                          'my Posts',
                          style: themeData.textTheme.headline6,
                        )),
                        IconButton(
                            onPressed: () {}, icon: Assets.img.icons.grid.svg()),
                        IconButton(
                            onPressed: () {}, icon: Assets.img.icons.table.svg()),
                      ],
                    ),
                  ),
                  for (var i = 0; i < posts.length; i++) Post(post: posts[i]),
                ],
              ),
            ),
            const SizedBox(height: 60,),

          ],
              ),
            ),
        ));
  }
}
