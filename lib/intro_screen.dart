import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

const bodyStyle = TextStyle(fontSize: 19.0);

const pageDecoration = PageDecoration(
  titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
  bodyTextStyle: bodyStyle,
  bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
  pageColor: Colors.white,
  imagePadding: EdgeInsets.zero,
);

const customDotsDecorator = DotsDecorator(
  size: Size.square(10.0),
  activeSize: Size(20.0, 10.0),
  color: Colors.black26,
  activeColor: Color(0xFF6C63FF),
  spacing: EdgeInsets.symmetric(horizontal: 3.0),
  activeShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25.0)),
  ),
);

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget _buildImage(String assertName,
        [double width = 400, double height = 400]) {
      return Image.asset('images/$assertName', width: width, height: height);
    }

    return Scaffold(
      body: IntroductionScreen(
        globalBackgroundColor: Colors.white,
        scrollPhysics: const BouncingScrollPhysics(),
        pages: [
          PageViewModel(
            title: "Write Title of Page",
            body:
                "Write the more description of the page. Write more and more description for this page.",
            image: _buildImage('screen_1.jpg'),
            decoration: pageDecoration,
          ),
        ],
        onDone: () {
          Navigator.pushNamed(context, "home");
        },
        onSkip: () {
          Navigator.pushNamed(context, "home");
        },
        showBackButton: false,
        showSkipButton: true,
        skip: const Text(
          "Skip",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF6C63FF),
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: Color(0xFF6C63FF),
        ),
        done: const Text(
          "Done",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(0xFF6C63FF),
          ),
        ),
        dotsDecorator: customDotsDecorator,
      ),
    );
  }
}
