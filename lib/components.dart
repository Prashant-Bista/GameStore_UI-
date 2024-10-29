import 'package:flutter/material.dart';
import 'package:gamestore_ui/data.dart';
Color primaryColor =Color.fromRGBO(30, 110, 150, 1);
Color secondaryColor =Color.fromRGBO(30, 110, 150, 1);

class ScrollableGameWidget extends StatelessWidget {
   final double height;
  final double width;
  final bool showTitle;
  final List<Game> gamesData;
   ScrollableGameWidget({super.key, required this.height, required this.width, required this.showTitle, required this.gamesData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ListView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: gamesData.map((_game){
          return Container(
            height: height,
            width: width*0.30,
            padding: EdgeInsets.only(right: width*0.03),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height*0.75,
                    width: width*0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(image: NetworkImage(_game.coverImage.url),fit: BoxFit.cover)
                    ),
                    ),
                showTitle?Text(
                  _game.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,fontSize: height*0.08
                  ),
                ):Container()
              ],
            ),
          );
        }).toList(),

      ),

    );
  }
}
