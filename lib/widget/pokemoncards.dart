import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PokedexCard extends StatefulWidget {
  final String title;
  final String imagePath;
  final String bgSvg1;
  final String bgSvg2;
  final Color gradientColor;
  final double height;
  final double width;
  final VoidCallback onTap;

  const PokedexCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.bgSvg1,
    required this.bgSvg2,
    required this.gradientColor,
    this.height = 80,
    this.width = 156,
    required this.onTap,
  });

  @override
  State<PokedexCard> createState() => _PokedexCardState();
}

class _PokedexCardState extends State<PokedexCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        clipBehavior: Clip.none,
        height: widget.height,
        width: widget.width,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset(
              widget.bgSvg1,
              colorFilter: ColorFilter.mode(
                widget.gradientColor,
                BlendMode.srcIn,
              ),
            ),
            SvgPicture.asset(
              widget.bgSvg2,
              colorFilter: ColorFilter.mode(
                widget.gradientColor,
                BlendMode.srcIn,
              ),
            ),
            Positioned(
              right: -10,
              top: -15,
              child: Image.asset(widget.imagePath, height: 71, width: 71),
            ),
            Positioned(
              left: 20,
              top: 25,
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
