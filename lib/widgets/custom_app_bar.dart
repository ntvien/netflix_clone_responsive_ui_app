import 'package:flutter/material.dart';
import 'package:netflix_responsive_ui_app/assets.dart';

class CustomAppBar extends StatelessWidget {
  final double? scrollOffset;
  CustomAppBar({this.scrollOffset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.red.withOpacity((scrollOffset! / 350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppBarButton(
                    title: "TV Shows",
                    onTap: () {},
                  ),
                  _AppBarButton(
                    title: "Movies",
                    onTap: () {},
                  ),
                  _AppBarButton(
                    title: "My list",
                    onTap: () {},
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

class _AppBarButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
  _AppBarButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        "$title",
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
