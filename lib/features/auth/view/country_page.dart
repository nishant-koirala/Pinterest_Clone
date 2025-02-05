import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/material.dart';

class CountryPage extends StatelessWidget {
  const CountryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
            text: "Select Your Country",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            children: [
              TextSpan(
                text:
                    "\nThis helps us to find more relevant content. We won't show this on your public profile.",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        Center(
          child: CountryListPick(
            onChanged: (CountryCode? code) {
              // Handle selected country
              print("Selected country: ${code?.name}, ${code?.dialCode}");
            },
            theme: CountryTheme(
              isShowFlag: true,
              isShowTitle: true,
              isShowCode: true,
              isDownIcon: true,
            ),
          ),
        ),
      ],
    );
  }
}