import 'package:flutter/material.dart';

import '../authentication/view/login_screen.dart';
import '../utils/global_methode.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding_circle.png",
      "title": "Find a relax flight for next trip",
      "subtitle": "Try this smart app for your next flight booking ticket",
    },
    {
      "image": "assets/images/onboarding_circle.png",
      "title": "Big world out there,Go Explore",
      "subtitle": "Easy to use the app for your next flight booking ticket",
    },
    {
      "image": "assets/images/onboarding_circle.png",
      "title": "Ready to take off the flight",
      "subtitle": "Easy to use the app for your next flight booking ticket",
    },
  ];

  void _nextPage() {
    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      // Navigate to Home or Login Screen
      Navigator.pushReplacement(
          context,
        MaterialPageRoute(builder: (context)=> LoginScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 8,
              child: PageView.builder(
                controller: _pageController,
                itemCount: onboardingData.length,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        onboardingData[index]["image"]!,
                        height: getDynamicSize(context, 0.85),
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        width:getDynamicSize(context,0.65),
                        child: Text(
                          onboardingData[index]["title"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: getDynamicSize(context,0.08),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        width:getDynamicSize(context,0.65),
                        child: Text(
                          onboardingData[index]["subtitle"]!,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: getDynamicSize(context,0.04),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Carousel Indicator
                    Row(
                      children: List.generate(
                        onboardingData.length,
                            (index) => Container(
                          margin: EdgeInsets.only(right: 5),
                          height: 8,
                          width: _currentPage == index ? 20 : 8,
                          decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.green
                                : Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                    // Next / Get Started button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding:
                        EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: _nextPage,
                      child: Text(
                        _currentPage == onboardingData.length - 1
                            ? "Get Started"
                            : "Next",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
