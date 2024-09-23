import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeButtonView extends StatelessWidget {
  const HomeButtonView(
      {super.key,
      required this.color,
      required this.icon,
      required this.value,
      required this.title,
      required this.onPressed});
  final Color color;
  final String icon;
  final String value;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 80,
          maxWidth: 170,
          minHeight: 80,
          minWidth: 170,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 50,
                maxWidth: 50,
                minHeight: 50,
                minWidth: 50,
              ),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
              child: SvgPicture.asset(
                icon,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      value,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
