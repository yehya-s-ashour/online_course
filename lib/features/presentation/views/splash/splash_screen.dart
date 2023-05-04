import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_course/core/Theme/styles/colors.dart';
import 'package:online_course/core/functions/navigator.dart';
import 'package:online_course/features/presentation/components/cutom_appbar.dart';
import 'package:online_course/features/presentation/views/constants.dart';
import 'package:online_course/features/presentation/views/sign/sign_screen.dart';

import 'components/splash_content.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "title": "Teaching",
      "text":
          "Our new service makes it easy for you to work anywhere, there are new features will ready help you.",
      "image": "assets/images/baorder3.png"
    },
    {
      "title": "Learning",
      "text":
          "Our new service makes it easy for you to work anywhere, there are new features will ready help you",
      "image": "assets/images/baorder2.png"
    },
    {
      "title": "Examination",
      "text":
          "Our new service makes it easy for you to work anywhere, there are new features will ready help you.",
      "image": "assets/images/baorder1.png"
    },
  ];
  double _progress = 0.33;

  void _incrementProgress() {
    setState(() {
      currentPage += 1;
      _progress += 0.33;
      if (_progress >= 1.0) {
        navigateAndFinish(context, SingScreen());
        _progress = 0.3;
        currentPage = 0;
      }
    });
  }

  void _decrementProgress() {
    setState(() {
      if (_progress >= 0.33) {
        currentPage -= 1;
        _progress -= 0.33;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isleading: true,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: InkWell(
            onTap: currentPage >= 1
                ? _decrementProgress
                : () {
                    Get.back();
                  },
            child: Container(
              padding: EdgeInsets.all(3.r),
              decoration: BoxDecoration(
                color: kLightColor.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_back,
                size: 24,
              ),
            ),
          ),
        ),
        action: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: currentPage >= 2
                    ? () {
                        navigateAndFinish(context, SingScreen());
                      }
                    : () {
                        currentPage = 2;
                        _progress = 1;
                        setState(() {});
                      },
                child: Padding(
                  padding: EdgeInsets.only(top: 6.h, right: 5.w),
                  child: Center(
                      child: Text(
                    currentPage >= 2 ? 'Get started' : 'Skip',
                    style: GoogleFonts.cairo(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        color: Color(0xF90E0E0E)),
                  )),
                )),
          )
        ],
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.w),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    physics: const BouncingScrollPhysics(),
                    pageSnapping: false,
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                        if (value == 1) {
                          _progress = 0.66;
                        } else if (value == 2) {
                          _progress = 1;
                        } else {
                          _progress -= 0.33;
                        }
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent(
                      title: splashData[currentPage]["title"],
                      image: splashData[currentPage]["image"],
                      text: splashData[currentPage]['text'],
                    ),
                  ),
                ),
                Expanded(
                  // flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: <Widget>[
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                        const Spacer(flex: 3),
                        GestureDetector(
                          onTap: _incrementProgress,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 80.0,
                                height: 80.0,
                                padding: EdgeInsets.all(8.r),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: Colors.grey[100]!,
                                    width: 4.0,
                                  ),
                                ),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: kPrimaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.arrow_right_alt_sharp,
                                    color: Colors.white,
                                  )),
                                ),
                              ),
                              CustomPaint(
                                size: const Size(80.0, 80.0),
                                painter: CircularProgressPainter(
                                  progress: _progress,
                                  color: kPrimaryColor,
                                  strokeWidth: 4.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: kAnimationDuration,
      margin: const EdgeInsets.only(right: 5),
      height: 6,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? kPrimaryColor : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }
}

class CircularProgressPainter extends CustomPainter {
  final double progress;
  final Color color;
  final double strokeWidth;

  CircularProgressPainter({
    required this.progress,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: min(size.width, size.height) / 2,
    );
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..color = color;
    canvas.drawArc(
      rect,
      -pi / 2,
      2 * pi * progress,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
