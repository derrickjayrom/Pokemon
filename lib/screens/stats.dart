import 'package:device_frame/device_frame.dart';
import 'package:flutter/material.dart';
import 'package:pokemon/screens/homescreen.dart';
import 'package:pokemon/screens/notification_page.dart';
import 'package:pokemon/screens/user_page.dart';
import 'package:pokemon/utils/app_colors.dart';
import 'package:pokemon/widget/custom_navbar.dart';

class Stats extends StatefulWidget {
  final String pokemonName;
  final Color backgroundColor;
  final Color primaryColor;
  final String imagePath;
  const Stats({
    super.key,
    required this.pokemonName,
    required this.backgroundColor,
    required this.primaryColor,
    required this.imagePath,
  });

  @override
  State<Stats> createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  int selectedIndex = 1;
  final List<String> tabs = ["ABOUT", "STATS", "MOVES", "EVOLUTIONS"];

  @override
  Widget build(BuildContext context) {
    return DeviceFrame(
      device: Devices.ios.iPhone13,
      isFrameVisible: true,
      orientation: Orientation.portrait,
      screen: Builder(
        builder: (frameContext) => _buildStatsScreen(frameContext),
      ),
    );
  }

  Widget _buildStatsScreen(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Color textColor = AppColors.kiconthemeColor;

    return SafeArea(
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: Stack(
          children: [
            Container(
              height: size.height * 0.45,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    widget.backgroundColor,
                    widget.primaryColor.withValues(alpha: 0.85),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(Icons.arrow_back, color: textColor, size: 24),
                  ),
                  Text(
                    widget.pokemonName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: textColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border_rounded,
                      color: textColor,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 70),
              child: Hero(
                tag: widget.imagePath,
                child: Image.asset(
                  widget.imagePath,
                  width: size.width,
                  height: 250,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.55,
              minChildSize: 0.55,
              maxChildSize: 0.9,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E1E1E),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: ListView(
                    controller: scrollController,
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
                    children: [
                      Center(
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: 40,
                          height: 5,
                          decoration: BoxDecoration(
                            color: Colors.grey[700],
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(tabs.length, (index) {
                          final bool isSelected = selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  tabs[index],
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                if (isSelected)
                                  Container(
                                    height: 6,
                                    width: 6,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  )
                                else
                                  const SizedBox(height: 6),
                              ],
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 30),
                      selectedIndex == 1
                          ? buildStatsSection()
                          : buildPlaceholderSection(tabs[selectedIndex]),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomNavBar(
                onHomeTap: () => Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const Homescreen()),
                  (route) => false,
                ),
                onNotificationsTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const NotificationPage()),
                ),
                onUserTap: () => Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (_) => const UserPage())),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStatsSection() {
    return Column(
      children: [
        buildStatRow("HP", 55, Colors.redAccent),
        buildStatRow("Attack", 46, Colors.greenAccent),
        buildStatRow("Defense", 46, Colors.greenAccent),
        buildStatRow("Sp. Atk", 33, Colors.greenAccent),
        buildStatRow("Sp. Def", 44, Colors.greenAccent),
        buildStatRow("Speed", 34, Colors.redAccent),
      ],
    );
  }

  Widget buildPlaceholderSection(String title) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          "$title info goes here",
          style: const TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildStatRow(String label, int value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(
            width: 60,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 40,
            child: Text(
              value.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: LinearProgressIndicator(
                value: value / 100,
                backgroundColor: Colors.grey[800],
                color: color,
                minHeight: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
