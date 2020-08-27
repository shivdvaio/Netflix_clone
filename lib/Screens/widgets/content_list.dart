import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/models/content_model.dart';

class ContentList extends StatelessWidget {
  final String title;
  final List<Content> contentList;
  final bool isOrginals;

  ContentList(
      {@required this.title,
      @required this.contentList,
      this.isOrginals = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Container(
              height: isOrginals ? 500.0 : 200.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  itemCount: contentList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Content content = contentList[index];
                    return GestureDetector(
                      onTap: () {print("hello");},
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(content.imageUrl),
                                fit: BoxFit.cover)),
                        height: isOrginals ? 400.0 : 200.0,
                        width: isOrginals ? 200.0 : 130.0,
                        margin: EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
