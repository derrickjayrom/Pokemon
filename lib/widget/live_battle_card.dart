import 'package:flutter/material.dart';
import 'package:pokemon/widget/buildavatar.dart';

class LiveBattleCard extends StatefulWidget {
  final String thumbnailPath;
  final String thumbnailPath1;
  final int viewerCount;
  final VoidCallback onPlayTap;

  const LiveBattleCard({
    super.key,
    required this.thumbnailPath,
    required this.viewerCount,
    required this.onPlayTap,
    required this.thumbnailPath1,
  });

  @override
  State<LiveBattleCard> createState() => _LiveBattleCardState();
}

class _LiveBattleCardState extends State<LiveBattleCard> {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> avatar = [
      {'imagePath': 'assets/icons/pngs/avatar1.png'},
      {'imagePath': 'assets/icons/pngs/avatar2.png'},
      {'imagePath': 'assets/icons/pngs/avatar3.png'},
    ];
    return Container(
      height: 147,
      width: 224,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(widget.thumbnailPath, fit: BoxFit.cover),
            ),

            Positioned(child: Image.asset(widget.thumbnailPath1)),
            Positioned(
              bottom: 10,
              left: 20,
              right: 20,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 45,
                        height: 18,
                        child: Stack(
                          children: [
                            buildAvatar(0.0, avatar[0]['imagePath']),
                            buildAvatar(12.0, avatar[1]['imagePath']),
                            buildAvatar(24.0, avatar[2]['imagePath']),
                          ],
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        '+ ${widget.viewerCount} Viewing',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: widget.onPlayTap,
                    child: Container(
                      height: 33.22,
                      width: 33.22,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(99),
                      ),
                      child: const Icon(
                        Icons.play_arrow_rounded,
                        color: Colors.black,
                        size: 20,
                      ),
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
