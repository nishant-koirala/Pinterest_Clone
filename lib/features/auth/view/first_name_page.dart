import 'package:flutter/material.dart';

class FirstNamePage extends StatefulWidget {
  const FirstNamePage({super.key});

  @override
  State<FirstNamePage> createState() => _FirstNamePageState();
}

class _FirstNamePageState extends State<FirstNamePage> {
  TextEditingController firstNameController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            "What's your first name?",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: firstNameController,
            decoration: InputDecoration(
              hintText: "First Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}