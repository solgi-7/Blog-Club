import 'package:blog_club/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static const int loginTab = 0;
  static const int logiUpTab = 1;
  int selectedTabIndex = loginTab;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final tabTextStyle = TextStyle(
      color: themeData.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    );
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28.0, bottom: 28.0),
            child: Assets.img.icons.logo.svg(width: 120),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32.0),
                    topRight: Radius.circular(32.0)),
                color: themeData.colorScheme.primary,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          child: Text(
                            'LOGIN',
                            style: tabTextStyle.apply(
                              color: selectedTabIndex == loginTab
                                  ? Colors.white
                                  : Colors.white54,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = loginTab;
                            });
                          },
                        ),
                        TextButton(
                          child: Text(
                            'SIGN UP',
                            style: tabTextStyle.apply(
                                color: selectedTabIndex == logiUpTab
                                    ? Colors.white
                                    : Colors.white54),
                          ),
                          onPressed: () {
                            setState(() {
                              selectedTabIndex = logiUpTab;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(32.0),
                          topRight: Radius.circular(32.0)),
                      color: themeData.colorScheme.surface,
                    ),
                    child: SingleChildScrollView(
                      child: selectedTabIndex == loginTab
                          ? _Login(themeData: themeData)
                          : _SignUp(themeData: themeData),
                    ),
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

class _Login extends StatelessWidget {
  const _Login({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back',
            style: themeData.textTheme.headline4,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'sign in with your account',
            style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const TextField(
            decoration: InputDecoration(label: Text('Username')),
          ),
          const PasswordTextField(),
          const SizedBox(
            height: 24.0,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60.0),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: const Text('LOGIN')),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Forgot Your Password ?'),
              TextButton(onPressed: () {}, child: const Text('Reset here')),
            ],
          ),
          const SizedBox(
            height: 4.0,
          ),
          const Center(
            child: Text(
              'OR SIGN  IN WITH',
              style: TextStyle(letterSpacing: 2.0),
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.google.image(width: 36.0, height: 36.0),
              const SizedBox(
                width: 24,
              ),
              Assets.img.icons.facebook.image(width: 36.0, height: 36.0),
              const SizedBox(
                width: 24,
              ),
              Assets.img.icons.twitter.image(width: 36.0, height: 36.0),
            ],
          )
        ],
      ),
    );
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp({
    Key? key,
    required this.themeData,
  }) : super(key: key);

  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'welcome to bolg club',
            style: themeData.textTheme.headline4,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            'please enter your information',
            style: themeData.textTheme.subtitle1!.apply(fontSizeFactor: 0.8),
          ),
          const SizedBox(
            height: 8.0,
          ),
          const TextField(
            decoration: InputDecoration(label: Text('FullName')),
          ),
           const TextField(
            decoration: InputDecoration(label: Text('UserName')),
          ),
          const PasswordTextField(),
          const SizedBox(
            height: 22.0,
          ),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width, 60.0),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: const Text('SIGN UP')),
         const SizedBox(
            height: 8.0,
          ),
          const Center(
            child: Text(
              'OR SIGN UP WITH',
              style: TextStyle(letterSpacing: 2.0),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Assets.img.icons.google.image(width: 36.0, height: 36.0),
              const SizedBox(
                width: 24,
              ),
              Assets.img.icons.facebook.image(width: 36.0, height: 36.0),
              const SizedBox(
                width: 24,
              ),
              Assets.img.icons.twitter.image(width: 36.0, height: 36.0),
            ],
          )
        ],
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  var obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        label: const Text('Password'),
        suffix: InkWell(
          onTap: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
          child: Text(
            obscureText ? 'Show' : 'Hide',
            style: TextStyle(
                fontSize: 14, color: Theme.of(context).colorScheme.primary),
          ),
          // style: const ButtonStyle(
          //     tapTargetSize:
          //         MaterialTapTargetSize.shrinkWrap),
        ),
      ),
    );
  }
}
