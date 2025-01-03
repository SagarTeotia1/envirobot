import 'package:envirobot/Screen/Discover/LeaderBoard.dart';
import 'package:envirobot/Screen/Discover/PostPageScreen.dart';
import 'package:flutter/material.dart';

class Discoverscreen extends StatefulWidget {
  const Discoverscreen({super.key});

  @override
  State<Discoverscreen> createState() => _DiscoverscreenState();
}

class _DiscoverscreenState extends State<Discoverscreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Post'),
            Tab(text: 'Leader'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Post Tab Content
          PostPage(),
          // Leader Tab Content
         LeaderboardTab()
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Define what happens when the button is pressed
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Upload a Post clicked!')),
          );
        },
        icon: const Icon(Icons.upload),
        label: const Text('Upload a Post'),
      ),
    );
  }
}
