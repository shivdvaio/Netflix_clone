import 'package:flutter_netflix_responsive_ui/data/data.dart';
import 'package:flutter_netflix_responsive_ui/main.dart';
import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';
import 'package:flutter_netflix_responsive_ui/Screens/widgets/content_header.dart';
import 'package:flutter_netflix_responsive_ui/Screens/widgets/preview.dart';
import 'widgets/content_list.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    _scrollController = ScrollController()..addListener(() {
        setState(() {
          _scrollOffset = _scrollController.offset;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(screenSize.width, 50),
        child: CustomAppbar(
          scrollOffset: _scrollOffset,
        ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("print");
        },
        child: Icon(Icons.cast),
        backgroundColor: Colors.grey[850],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(featuredContent: sintelContent),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            sliver: SliverToBoxAdapter(
              child: Preview(
                title: "Previews",
                contentList: previews,
              ),
            ),
          ),
          SliverToBoxAdapter(child: ContentList(
          title: "My List",
            contentList: myList,
            isOrginals: false,

          ),),
          SliverToBoxAdapter(child: ContentList(
              title:"Netflix Orginals",
              contentList: originals ,
            isOrginals: true,

          ),),
          SliverToBoxAdapter(child: ContentList(
              title:"Trending",
              contentList: trending,
            isOrginals: false,

          )
            ,)
        ],
      ),
    );
  }
}
