import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokemon/screens/notification_page.dart';
import 'package:pokemon/screens/search.dart';
import 'package:pokemon/screens/user_page.dart';
import 'package:pokemon/utils/app_colors.dart';
import 'package:pokemon/widget/custom_navbar.dart';
import 'package:pokemon/widget/live_battle_card.dart';
import 'package:pokemon/widget/pokemoncards.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    const String avatar = 'assets/icons/pngs/avatar.png';

    final List<Map<String, dynamic>> menuItems = [
      {
        'title': 'Pokedex',
        'imagePath': 'assets/icons/pngs/pokedex.png',
        'bgSvg1': 'assets/icons/svgs/rectagle1.svg',
        'bgSvg2': 'assets/icons/svgs/rectangle.svg',
        'color': AppColors.kpokadexgradient2,
      },
      {
        'title': 'Moves',
        'imagePath': 'assets/icons/pngs/moves.png',
        'color': AppColors.kmovesgradient2,
      },
      {
        'title': 'Evolution',
        'imagePath': 'assets/icons/pngs/evolution.png',
        'color': AppColors.kevolutiongradient2,
      },
      {
        'title': 'Locations',
        'imagePath': 'assets/icons/pngs/locations.png',
        'color': AppColors.klocationsgradient2,
      },
    ];
    final List<Map<String, dynamic>> liveBattleItems = [
      {'imagePath': 'assets/icons/pngs/maskblur.png'},
      {'imagePath': 'assets/icons/pngs/mask1.png'},
      {'imagePath': 'assets/icons/pngs/maskblur1.png'},
      {'imagePath': 'assets/icons/pngs/mask2.png'},

      {'imagePath': 'assets/icons/pngs/maskblur2.png'},
      {'imagePath': 'assets/icons/pngs/mask3.png'},

      {'imagePath': 'assets/icons/pngs/maskblur2.png'},
      {'imagePath': 'assets/icons/pngs/mask4.png'},
    ];

    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        onHomeTap: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const Homescreen()),
          (route) => false,
        ),
        onNotificationsTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const NotificationPage())),
        onUserTap: () => Navigator.of(
          context,
        ).push(MaterialPageRoute(builder: (_) => const UserPage())),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SvgPicture.asset(
              'assets/icons/svgs/background.svg',
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 63),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        child: ClipOval(
                          child: Image.asset(avatar, fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'Hi!',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: AppColors.kiconthemeColor,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(width: 8.0),
                      Text(
                        'Stanly',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                          height: 1.2,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Text('👋', style: TextStyle(fontSize: 35, height: 1.2)),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  const Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF757575),
                    ),
                  ),
                  const SizedBox(height: 24),

                  Row(
                    children: [
                      PokedexCard(
                        title: menuItems[0]['title'],
                        imagePath: menuItems[0]['imagePath'],
                        gradientColor: menuItems[0]['color'],
                        bgSvg1: menuItems[0]['bgSvg1'],
                        bgSvg2: menuItems[0]['bgSvg2'],
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => Search()),
                          );
                          // Navigator.push
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => DeviceFrame(
                          //       device: Devices.ios.iPhone13,
                          //       isFrameVisible: true,
                          //       orientation: Orientation.portrait,
                          //       screen: const Search(),
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      const SizedBox(width: 16),
                      PokedexCard(
                        title: menuItems[1]['title'],
                        imagePath: menuItems[1]['imagePath'],
                        gradientColor: menuItems[1]['color'],
                        bgSvg1: menuItems[0]['bgSvg1'],
                        bgSvg2: menuItems[0]['bgSvg2'],
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: [
                      PokedexCard(
                        title: menuItems[2]['title'],
                        imagePath: menuItems[2]['imagePath'],
                        gradientColor: menuItems[2]['color'],
                        bgSvg1: menuItems[0]['bgSvg1'],
                        bgSvg2: menuItems[0]['bgSvg2'],
                        onTap: () {},
                      ),
                      const SizedBox(width: 16),
                      PokedexCard(
                        title: menuItems[3]['title'],
                        imagePath: menuItems[3]['imagePath'],
                        gradientColor: menuItems[3]['color'],
                        bgSvg1: menuItems[0]['bgSvg1'],
                        bgSvg2: menuItems[0]['bgSvg2'],
                        onTap: () {},
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),
                  const Text(
                    'Live Battle',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 20),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 14,
                      children: <Widget>[
                        LiveBattleCard(
                          thumbnailPath: liveBattleItems[0]['imagePath'],
                          thumbnailPath1: liveBattleItems[1]['imagePath'],
                          viewerCount: 568,
                          onPlayTap: () {},
                        ),

                        LiveBattleCard(
                          thumbnailPath: liveBattleItems[2]['imagePath'],
                          thumbnailPath1: liveBattleItems[3]['imagePath'],
                          viewerCount: 342,
                          onPlayTap: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Live Battle',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      spacing: 14,
                      children: <Widget>[
                        LiveBattleCard(
                          thumbnailPath: liveBattleItems[4]['imagePath'],
                          thumbnailPath1: liveBattleItems[5]['imagePath'],
                          viewerCount: 568,
                          onPlayTap: () {},
                        ),

                        LiveBattleCard(
                          thumbnailPath: liveBattleItems[6]['imagePath'],
                          thumbnailPath1: liveBattleItems[7]['imagePath'],
                          viewerCount: 342,
                          onPlayTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
