import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';

class CustomAppbar extends StatelessWidget {
   CustomAppbar({this.scrollOffset});

  final double  scrollOffset;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 24 ),
        child: SafeArea(
          child: Row(
            children: [
            Image.asset(Assets.netflixLogo0),
            SizedBox(width: 12,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                _appBarButton(buttonName: "TV Shows",onTapfunction: (){},),
                _appBarButton(buttonName: "Movies",onTapfunction: (){},),
                _appBarButton(buttonName: "My List",onTapfunction: (){},),

              ],),
            )
          ],),
        ),
      color: Colors.black.withOpacity((scrollOffset ?? 0/350).clamp(0, 1).toDouble()),
    );
  }
  
  
}

class _appBarButton extends StatelessWidget {
  final String buttonName;
  Function onTapfunction;
_appBarButton({this.buttonName,this.onTapfunction});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text("$buttonName",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 16),),
      onTap: onTapfunction,);
  }
}


