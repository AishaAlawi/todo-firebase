import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home.dart';

class Intro extends StatefulWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Colors.white,
      showNextButton: true,
      showDoneButton: true,
      showSkipButton: false,
      done: Text('Done'),
      onDone: () => Get.to(() => const Home()),
      next: Icon(Icons.arrow_forward),
      pages: [
        PageViewModel(
          image: SvgPicture.asset('assets/int1.svg'),
          title: 'Todo App',
          decoration: const PageDecoration(
            imagePadding: EdgeInsets.only(top: 60.0),
          ),
          body:
              'A to-do list app lets you write, organize, and reprioritize your tasks more efficiently.',
        ),
        PageViewModel(
          image: SvgPicture.asset('assets/int2.svg'),
          title: 'Fun to use',
          decoration: const PageDecoration(
            imagePadding: EdgeInsets.only(top: 60.0),
          ),
          body: 'ultimate productivity app.',
        ),
      ],
    );
  }
}
