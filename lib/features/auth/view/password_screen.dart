import 'package:flutter/material.dart';
import 'package:test/features/auth/view/gender_page.dart';

import 'country_page.dart';
import 'date_of_birth_page.dart';
import 'first_name_page.dart';
import 'interest_screen.dart';
import 'password_entry_screen.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({super.key});

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  PageController controller = PageController();
  int currentIndex = 0;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            6, // Increase page count for the new page
            (index) => Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex > index
                    ? Colors.grey
                    : currentIndex == index
                        ? Colors.white
                        : Colors.grey[300],
                border: currentIndex == index
                    ? Border.all(
                        color: Colors.black,
                        width: 5,
                      )
                    : null,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            if (currentIndex < 5) {
              controller.jumpToPage(currentIndex + 1);
              // Supabase.instance.client.auth.signUp(password: password);
              //  Supabase.instance.client.from("user").insert(values)
            }
          },
          child: Text("Continue"),
        ),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        children: [
          PasswordPage(),
          FirstNamePage(),
          DateOfBirthPage(),
          GenderPage(),
          CountryPage(),
          InterestScreen(),
        ],
      ),
    );
  }
}
