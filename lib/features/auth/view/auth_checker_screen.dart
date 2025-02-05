import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:test/features/auth/widget/social_auth_widget.dart';

import 'login_screen.dart';
import 'password_screen.dart';

class AuthCheckerScreen extends StatefulWidget {
  const AuthCheckerScreen({super.key});

  @override
  State<AuthCheckerScreen> createState() => _AuthCheckerScreenState();
}

class _AuthCheckerScreenState extends State<AuthCheckerScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

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
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Email address",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 15,
                      horizontal: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29.0),
                child: ElevatedButton(
                  onPressed: isLoading
                      ? null
                      : () async {
                          setState(() {
                            isLoading = true;
                          });
                          final supabaseClient = Supabase.instance.client;
                          try {
                            await supabaseClient
                                .from("user")
                                .select('id')
                                .eq('email', emailController.text)
                                .single();

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(
                                  email: emailController.text,
                                ),
                              ),
                            );
                          } catch (e) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => CreatePassword(),
                              ),
                            );
                          } finally {
                            setState(() {
                              isLoading = false;
                            });
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                ),
              ),
              const SizedBox(height: 10),
              // Use the SocialAuthScreen widget here
              const SocialAuthWidget(),
              const SizedBox(height: 10),
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
      ),
    );
  }
}
