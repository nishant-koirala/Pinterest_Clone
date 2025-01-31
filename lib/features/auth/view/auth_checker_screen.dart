import 'package:flutter/material.dart';

import 'create_password.dart';

class AuthCheckerScreen extends StatelessWidget {
  const AuthCheckerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset("assets/images/loginimg.png"),
            Text.rich(
              TextSpan(
                  text: "Create a life you love\n",
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                        text: "On Pinterest",
                        style: const TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.w500,
                        ))
                  ]),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29.0),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: "Email address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20,
                      )),
                )),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreatePassword()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Center(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: SizedBox(
                width: double
                    .infinity, // Makes the button stretch to fill the available width
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.facebook,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: const Text(
                    "Continue with Facebook",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 29.0),
              child: SizedBox(
                width: double
                    .infinity, // Makes the button stretch to fill the available width
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/logos/google.png",
                    height: 25,
                    width: 25,
                  ),
                  label: const Text(
                    "Continue with Google",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: "By continuing, you agree to Pinterest's ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  children: [
                    TextSpan(
                      text: "Terms\nof Service",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(
                      text: " and acknowledge that you've read our ",
                    ),
                    TextSpan(
                      text: "Privacy\n Policy.Notice of Collection",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextSpan(text: "."),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
