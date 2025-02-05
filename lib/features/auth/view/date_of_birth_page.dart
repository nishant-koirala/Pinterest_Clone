import 'package:flutter/material.dart';

class DateOfBirthPage extends StatefulWidget {
  const DateOfBirthPage({super.key});

  @override
  State<DateOfBirthPage> createState() => _DateOfBirthPageState();
}

class _DateOfBirthPageState extends State<DateOfBirthPage> {
  DateTime? _selectedDate;
  String formattedDate = 'Select your date of birth';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        formattedDate = "${_selectedDate!.toLocal()}".split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text.rich(
            TextSpan(
              text: "Hi Nishant! Enter your date of birth",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text:
                      "\n\nTo help keep Pinterest safe, we now require your date of birth. Your date of birth also helps us provide more personalized recommendations and relevant ads. We won't share this information without your permission and it won't be visible on your profile.",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _selectDate(context),
            child: Text(
              formattedDate,
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: _selectedDate != null ? Colors.black : Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 10),
          const Center(
            child: Text(
              "Use your own age, even if this is a business account",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}