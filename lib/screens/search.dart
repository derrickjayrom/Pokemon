import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokemon/screens/homescreen.dart';
import 'package:pokemon/screens/notification_page.dart';
import 'package:pokemon/screens/stats.dart';
import 'package:pokemon/screens/user_page.dart';
import 'package:pokemon/utils/app_colors.dart';
import 'package:pokemon/widget/custom_navbar.dart';
import 'package:pokemon/widget/pokemoncard_search.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final List<Map<String, dynamic>> pokemonData = [
    {
      'name': 'Jigglypuff',
      'imagePath': 'assets/icons/pngs/jigglypuff3x.png',
      'backgroundColor': AppColors.kjigglypuffgradient1,
      'primaryColor': AppColors.kjigglypuffgradient2,
      'textColor': AppColors.kiconthemeColor,
    },
    {
      'name': 'Bulbasaur',
      'imagePath': 'assets/icons/pngs/bulb.png',
      'backgroundColor': AppColors.kbulbasaurgradient1,
      'primaryColor': AppColors.kbulbasaurgradient2,
      'textColor': AppColors.kiconthemeColor,
    },
    {
      'name': 'Pikachu',
      'imagePath': 'assets/icons/pngs/pikachu3x.png',
      'backgroundColor': AppColors.kpikachugradient1,
      'primaryColor': AppColors.kpikachugradient2,
      'textColor': AppColors.kiconthemeColor,
    },
    {
      'name': 'Polywad',
      'imagePath': 'assets/icons/pngs/poly.png',
      'backgroundColor': AppColors.kpolywadgradient1,
      'primaryColor': AppColors.kpolywadgradient2,
      'textColor': AppColors.kiconthemeColor,
    },
  ];

  final List<Map<String, dynamic>> avatardata = [
    {'imagePath': 'assets/icons/pngs/avatar.png'},
  ];
  final List<Map<String, dynamic>> backgrounddata = [
    {'imagePath': 'assets/icons/svgs/background.svg'},
  ];

  String searchQuery = '';
  @override
  Widget build(BuildContext context) {
    String avatar = avatardata[0]['imagePath'];
    final filteredPokemon = pokemonData
        .where(
          (pokemon) => (pokemon['name'] as String).toLowerCase().contains(
            searchQuery.toLowerCase(),
          ),
        )
        .toList();

    return SafeArea(
      child: Scaffold(
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
                backgrounddata[0]['imagePath'],
                fit: BoxFit.fitWidth,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 63,
                ),
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

                    SizedBox(height: 27),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Hi! What Are You Looking For?',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w800,
                            color: AppColors.kiconthemeColor,
                            height: 1.2,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 18),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.white.withValues(alpha: 0.4),
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(color: Colors.white),
                              onChanged: (value) =>
                                  setState(() => searchQuery = value),
                              decoration: InputDecoration(
                                hintText: "Search",
                                hintStyle: TextStyle(
                                  color: Colors.white.withValues(alpha: 0.4),
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 26),

                    if (filteredPokemon.isEmpty)
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 32),
                        child: Text(
                          'No Pokémon found',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      )
                    else
                      Wrap(
                        spacing: 18,
                        runSpacing: 32,
                        children: filteredPokemon
                            .map(
                              (pokemon) => PokemonCard(
                                name: pokemon['name'] as String,
                                imagePath: pokemon['imagePath'] as String,
                                backgroundColor:
                                    pokemon['backgroundColor'] as Color,
                                textColor: pokemon['textColor'] as Color,
                                onTap: () => showStats(pokemon),
                              ),
                            )
                            .toList(),
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

  void showStats(Map<String, dynamic> pokemon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Stats(
          pokemonName: pokemon['name'] as String,
          backgroundColor: pokemon['backgroundColor'] as Color,
          primaryColor: pokemon['primaryColor'] as Color,
          imagePath: pokemon['imagePath'] as String,
        ),
      ),
    );
  }
}
