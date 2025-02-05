import 'package:flutter/material.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController passwordController = TextEditingController();
  String? _passwordError;

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  void _validatePassword() {
    setState(() {
      if (passwordController.text.length < 8) {
        _passwordError = "Password must be at least 8 characters long.";
      } else {
        _passwordError = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
            child: const Text(
              "Create a password",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: "Password",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              errorText: _passwordError,
            ),
            obscureText: true,
            onChanged: (_) => _validatePassword(),
          ),
        ],
      ),
    );
  }
}
