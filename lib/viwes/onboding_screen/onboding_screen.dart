import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<String> titles = ["Choose Products", "Make Payment", "Get Your Order"];
  List<String> descriptions = [
    "Amet minim mollit non deserunt ullamco est sit aliqua dolor do sint. Velit officia consequat duis enim velit mollit.",
    "Make secure payments with ease using our system.",
    "Receive your order promptly and enjoy your purchase!"
  ];
  List<String> images = [
    "assets/images/fashion shop-rafiki 1.png", // First image
    "assets/images/fashion_shop_1.png", // Second image
    "assets/images/fashion_shop_1.png" // Third image
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 17, right: 17),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${_currentPage + 1}/3"),
                TextButton(
                  onPressed: () { },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        images[index],
                        cacheHeight: 300,
                        cacheWidth: 300,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        titles[index],
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        descriptions[index],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Color(0xFFA8A8A9), fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage != 0)
                  TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: const Text("Previous"),
                  ),
                if (_currentPage != 2)
                  TextButton(
                    onPressed: () {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                    child: const Text("Next"),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
