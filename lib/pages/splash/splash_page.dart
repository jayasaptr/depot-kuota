import 'package:depotkuota/pages/onboard/onboard_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 1),
      () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const OnboardPage(),
            ),
            (route) => false);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff128ED3),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: MediaQuery.of(context).size.width * 0.7,
        ),
      ),
    );
  }
}
