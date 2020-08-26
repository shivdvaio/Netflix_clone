import 'package:flutter/material.dart';
import 'vertical_iconButton.dart';
import 'content_header.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';

import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class Preview extends StatelessWidget {
  final String title;

  final List<Content> contentList;

  Preview({@required this.title, @required this.contentList});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Container(
            height: 165,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contentList.length,
              itemBuilder: (BuildContext context, int index) {
                final Content content = contentList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          height: 130,
                          width: 130.0,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: content.color, width: 4.0),
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(content.imageUrl))),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16.0),
                          height: 130,
                          width: 130.0,
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: content.color, width: 4.0),
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.black45,
                                    Colors.transparent,
                                    Colors.black87
                                  ],
                                  stops: [
                                    0,
                                    0.25,
                                    1
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter)),
                        ),
                        Positioned(
                          left: 0,
                          right: 0,
                          bottom: 0,
                          child: SizedBox(
                            height: 60,
                            child: Image.asset(content.titleImageUrl),
                          ),
                        )
                      ],
                    ),
                    onTap: () {
                      print(content.name);
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
