import 'package:flutter/material.dart';
import 'package:test/features/auth/view/auth_checker_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logos/pinterest.png",
          height: 120,
          width: 120,
        ),
      ),
    );
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return AuthCheckerScreen();
      }));
    });
    super.initState();
  }
}
