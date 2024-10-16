import 'package:ecommerce/viwes/splash_screeen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ecommerce());
}

class ecommerce extends StatelessWidget {
  const ecommerce({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
