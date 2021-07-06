import 'package:flutter/material.dart';
import 'package:netflix_responsive_ui_app/assets.dart';
import 'package:netflix_responsive_ui_app/widgets/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final double? scrollOffset;
  CustomAppBar({this.scrollOffset = 0.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 24.0),
      color: Colors.black
          .withOpacity((scrollOffset! / 350).clamp(0, 1).toDouble()),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo0),
          const SizedBox(width: 12.0),
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
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image.asset(Assets.netflixLogo1),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: "Home", onTap: () {}),
                _AppBarButton(title: "TV Shows", onTap: () {}),
                _AppBarButton(title: "Movies", onTap: () {}),
                _AppBarButton(title: "Latest", onTap: () {}),
                _AppBarButton(title: "My list", onTap: () {}),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print("Search"),
                  icon: Icon(Icons.search),
                  iconSize: 28,
                  color: Colors.white,
                ),
                _AppBarButton(title: "KIDS", onTap: ()=>print("KIDS")),
                _AppBarButton(title: "DVD", onTap: ()=>print("DVD")),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print("Gift"),
                  icon: Icon(Icons.card_giftcard),
                  iconSize: 28,
                  color: Colors.white,
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () => print("Notifications"),
                  icon: Icon(Icons.notifications),
                  iconSize: 28,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
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
