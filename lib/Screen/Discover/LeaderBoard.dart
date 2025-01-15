import 'package:flutter/material.dart';
// Assuming you have the logo defined in this file

class LeaderboardTab extends StatelessWidget {
  const LeaderboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Use a SingleChildScrollView to handle small screen sizes and prevent overflow
    return SingleChildScrollView(
      child: Column(
        children: [
          LeaderBoardCard(),
          SizedBox(height: 15),
          LeaderBoardCard2(),
          SizedBox(height: 15),
          LeaderBoardCard(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

Widget LeaderBoardCard() {
  // List of 5 donors (using dummy data)
  final List<Map<String, String>> donors = [
    {'name': 'John Doe', 'profileImage': 'assets/images/Sagar.jpg'},   // Use the same logo for all donors
    {'name': 'Jane Smith', 'profileImage': 'assets/images/Sagar.jpg'},
    {'name': 'Michael Lee', 'profileImage': 'assets/images/Sagar.jpg'},
    {'name': 'Alice Johnson', 'profileImage':"assets/images/Sagar.jpg"},

  ];

  return Container(
    margin: EdgeInsets.all(10), // Optional: Adjusts the margin for each event card
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white, width: 2), // White border with width of 2
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: Offset(4, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Top Travellers ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // List of Donors
        for (var donor in donors)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(donor['profileImage']!), // Using the same profile image for all donors
                ),
                SizedBox(width: 8),
                // Username Text
                Text(
                  donor['name']!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                // Text Button (Follow)
                TextButton(
                  onPressed: () {
                    // Add action for the button (e.g., navigate to profile)
                  },
                  child: Text(
                    "Follow",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}

Widget LeaderBoardCard2() {
  // List of 5 donors (using dummy data)
  final List<Map<String, String>> donors = [
    {'name': 'John Doe', 'profileImage': 'assets/images/Sagar.jpg'},   // Use the same logo for all donors
    {'name': 'Jane Smith', 'profileImage': 'assets/images/Sagar.jpg'},
    {'name': 'Michael Lee', 'profileImage': 'assets/images/Sagar.jpg'},
    {'name': 'Alice Johnson', 'profileImage':"assets/images/Sagar.jpg"},

  ];

  return Container(
    margin: EdgeInsets.all(10), // Optional: Adjusts the margin for each event card
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: Colors.white, width: 2), // White border with width of 2
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: Offset(4, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Best Waste Recycler ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // List of Donors
        for (var donor in donors)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              children: [
                // Profile Image
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(donor['profileImage']!), // Using the same profile image for all donors
                ),
                SizedBox(width: 8),
                // Username Text
                Text(
                  donor['name']!,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
                Spacer(),
                // Text Button (Follow)
                TextButton(
                  onPressed: () {
                    // Add action for the button (e.g., navigate to profile)
                  },
                  child: Text(
                    "Follow",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
      ],
    ),
  );
}
