import 'package:envirobot/Const/const_fonts.dart';
import 'package:envirobot/Screen/ChooseAvatar/ChooseAvatar.dart';
import 'package:envirobot/Widget/Splash/AppiconWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:animated_text_kit/animated_text_kit.dart'; // Import the animated_text_kit package

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to ChooseAvatarScreen after 5 seconds
    Future.delayed(Duration(seconds: 5), () {
      Get.off(() => ChooseAvatarScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/images/splashpagebg.png',
            fit: BoxFit.cover,
          ),
          // Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Align children horizontally in the center
                children: [
                  AppIconWidget(),
                  const SizedBox(height: 15),
                  Text(
                    "EnviroBot",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: regularfont,
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Animated Text using AnimatedTextKit
                  SizedBox(    
                    width: MediaQuery.of(context).size.width *
                        0.8, // Set width to avoid text overflow
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(
                          "Guiding a Greener Tomorrow, One Step at a Time.",
                          speed: const Duration(milliseconds: 100),
                          textStyle: TextStyle(
                            fontSize: 24,
                            fontFamily: itallicfont,
                            color: Colors.black,
                          ),
                        ),
                      ],
                      isRepeatingAnimation:
                          false, // Set to false to show the animation once
                      onFinished: () {
                        // Optionally do something when the animation finishes
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
