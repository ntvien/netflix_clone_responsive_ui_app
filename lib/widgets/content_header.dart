import 'package:flutter/material.dart';
import 'package:netflix_responsive_ui_app/models/models.dart';

class ContentHeader extends StatelessWidget {
  final Content? featureContent;
  ContentHeader({this.featureContent});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(featureContent!.imageUrl as String),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 500,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black, Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 110,
          child: SizedBox(
            width: 250,
            child: Image.asset(featureContent!.titleImageUrl as String),
          ),
        ),
      ],
    );
  }
}
