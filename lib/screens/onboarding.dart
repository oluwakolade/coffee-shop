import 'package:coffee_shop/constants/button_constant.dart';
import 'package:coffee_shop/constants/text_constant.dart';
import 'package:coffee_shop/screens/home_page.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050505),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets_coffee/images/background.png",
                width: 200,
                fit: BoxFit.fill,
              ),
              const SizedBox(
                height: 12,
              ),
              const AppText(
                  text: "Fall in Love with Coffee in Blissful Delight!",
                  color: Color(0xFFF9F9F9),
                  fontWeight: FontWeight.bold,
                  fontsize: 24),
              const SizedBox(
                height: 12,
              ),
              const AppText(
                  text:
                      "Welcome to our cozy coffee corner, where every cup is a delightful for you",
                  color: Color(0xFFA2A2A2),
                  fontWeight: FontWeight.normal,
                  fontsize: 14),
              const Expanded(
                child: SizedBox(),
              ),
              AppButton(
                text: "Get Started",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
