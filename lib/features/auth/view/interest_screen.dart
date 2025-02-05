import 'package:flutter/material.dart';

class InterestScreen extends StatefulWidget {
  @override
  _InterestScreenState createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  List<String> interests = [
    "Wallpapers",
    "Memes",
    "Funny",
    "Art",
    "Vehicles",
    "Anime",
    "Tattoos",
    "NBA",
    "Men's Fashion",
    "Photography",
    "Animals",
    "Design",
    "Soldier",
    "Men's Style",
    "Relationships",
    "Cars",
    "Funny Panels",
    "Food & Drink",
    "Rappers",
    "Drawings"
  ];

  List<String> selectedInterests = [];

  void toggleSelection(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "What are you interested in?",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Pick 5 to customize your home feed",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemCount: interests.length,
              itemBuilder: (context, index) {
                String interest = interests[index];
                bool isSelected = selectedInterests.contains(interest);

                return GestureDetector(
                  onTap: () => toggleSelection(interest),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: isSelected ? Colors.red[300] : Colors.grey[200],
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://source.unsplash.com/random?${interest}"), // Placeholder image
                        fit: BoxFit.cover,
                        colorFilter: isSelected
                            ? ColorFilter.mode(
                                Colors.black.withOpacity(0.5), BlendMode.darken)
                            : null,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            color: Colors.black.withOpacity(0.6),
                            child: Text(
                              interest,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Align(
                            alignment: Alignment.topRight,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child:
                                  Icon(Icons.check_circle, color: Colors.white),
                            ),
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: selectedInterests.length >= 5
          ? FloatingActionButton.extended(
              onPressed: () {
                print("Selected Interests: $selectedInterests");
              },
              backgroundColor: Colors.red,
              label: Text("Meet your home feed"),
            )
          : null,
    );
  }
}
