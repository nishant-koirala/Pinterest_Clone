import 'package:flutter/material.dart';

class CountrySelectorScreen extends StatelessWidget {
  const CountrySelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      SafeArea(
        child: Text.rich(
          TextSpan(
            text: "\nWhat's your country or region?",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text:
                    "\nThis helps us to find more relivent content. We won't show this on your public profile.",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
      const SizedBox(height: 20),
    ]));
  }
}
