import 'dart:ui';
import 'vertical_iconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/Screens/home_screen.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';
import 'preview.dart';

class ContentHeader extends StatelessWidget {
  ContentHeader({this.featuredContent});

  final Content featuredContent;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 500,
          decoration: BoxDecoration(
              image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(featuredContent.imageUrl),
          )),
        ),
        Container(
          height: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter)),
        ),
        Positioned(
            bottom: 110.0,
            child: SizedBox(
              width: 250,
              child: Image.asset(featuredContent.titleImageUrl),
            )),
        Positioned(
          left: 0,
          right: 0,
          bottom: 40,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              VerticalIconButton(
                icon: Icons.add,
                onTap: () {
                  print("hello");
                },
                title: "List",
              ),
              PlayButton(),
              VerticalIconButton(
                icon: Icons.info_outline,
                onTap: () {
                  print("hello");
                },
                title: "List",
              )
            ],
          ),
        ),

      ],
    );
  }
}

class PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      padding: EdgeInsets.fromLTRB(15, 5, 20, 5),
        color: Colors.white,
        onPressed: () {
          print("play");
        },
        icon: Icon(
          Icons.play_arrow,
          size: 30,
        ),
        label: Text(
          "Play",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ));
  }
}
