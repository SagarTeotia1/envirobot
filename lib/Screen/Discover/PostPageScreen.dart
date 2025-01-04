import 'package:flutter/material.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
 
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  postCard(
                    title: "A Mesmerizing Journey",
                    visitorName: "John Doe",
                    profileImage: 'assets/images/Sagar.jpg',
                    reviewText:
                        "Exploring the Taj Mahal was a once-in-a-lifetime experience!",
                    imagePath: 'assets/images/TajTour.jpg',
                    onLikePressed: () => print("Liked: A Mesmerizing Journey"),
                    onFollowPressed: () => print("Followed: John Doe"),
                  ),
                  postCard(
                    title: "Unforgettable Memories",
                    visitorName: "Jane Smith",
                    profileImage: 'assets/images/Sagar.jpg',
                    reviewText: "Particpating a Composite Campiagn",
                    imagePath: 'assets/images/zero.png',
                    onLikePressed: () => print("Liked: Unforgettable Memories"),
                    onFollowPressed: () => print("Followed: Jane Smith"),
                  ),
                  postCard(
                    title: "Historical Wonders",
                    visitorName: "Alex Johnson",
                    profileImage: 'assets/images/Sagar.jpg',
                    reviewText: "Travelling Turkery Dispite of Disability",
                    imagePath: 'assets/images/turkey.jpg',
                    onLikePressed: () => print("Liked: Historical Wonders"),
                    onFollowPressed: () => print("Followed: Alex Johnson"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget postCard({
    required String title,
    required String visitorName,
    required String profileImage,
    required String reviewText,
    required String imagePath,
    required VoidCallback onLikePressed,
    required VoidCallback onFollowPressed,
  }) {
    // Ensure no null values are passed in
    if (title.isEmpty || visitorName.isEmpty || profileImage.isEmpty || imagePath.isEmpty || reviewText.isEmpty) {
      return Container(); // Return an empty container if any string is empty
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.grey[300]!,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 6,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Background image
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 140,
                    ),
                  ),
                  // Bookmark Icon
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Icon(
                      Icons.bookmark,
                      color: const Color(0xFF91AC8F),
                      size: 24,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Post Title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 6),
                    // Post Content
                    Text(
                      reviewText,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    // Profile Section with Like and Follow buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Profile Image and Name
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 16,
                              backgroundImage: AssetImage(profileImage),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              visitorName,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                        // Like and Follow Buttons
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.thumb_up_alt_outlined),
                              color: Colors.blue,
                              onPressed: onLikePressed,
                            ),
                            const SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: onFollowPressed,
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 10),
                              ),
                              child: const Text("Follow"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
