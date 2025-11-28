import 'package:flutter/material.dart';

class PokemonCard extends StatefulWidget {
  final String name;
  final String imagePath;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback? onTap;

  const PokemonCard({
    super.key,
    required this.name,
    required this.imagePath,
    required this.backgroundColor,
    required this.textColor,
    this.onTap,
  });

  @override
  State<PokemonCard> createState() => _PokemonCardState();
}

class _PokemonCardState extends State<PokemonCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 185,
            width: 154,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: widget.backgroundColor,
            ),
          ),

          Positioned(
            top: -10,
            child: Image.asset(
              widget.imagePath,
              height: 178,
              width: 174,
              fit: BoxFit.contain,
            ),
          ),

          Positioned(
            bottom: 10,
            left: 15,
            child: Text(
              widget.name,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(99),
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(
                Icons.arrow_forward,
                size: 18,
                color: widget.textColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
