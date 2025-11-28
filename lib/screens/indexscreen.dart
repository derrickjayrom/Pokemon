import 'package:flutter/material.dart';
import 'package:pokemon/screens/homescreen.dart';
import 'package:pokemon/screens/search.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({super.key});

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          Scaffold(backgroundColor: Colors.yellow),
          Homescreen(),
          Search(),
          Scaffold(backgroundColor: Colors.black),
        ],
      ),

      // bottomNavigationBar: ConvexBottomNavBar(
      //   currentIndex: currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      // ),
    );
  }
}
