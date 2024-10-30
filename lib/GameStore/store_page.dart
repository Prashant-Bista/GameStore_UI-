import 'package:flutter/material.dart';
import 'package:gamestore_ui/components.dart';
import 'package:gamestore_ui/login_page.dart';
import 'game_data.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});
  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  late double _deviceWidth;
  late double _deviceHeight;
  late int _selectedGame;
  @override
  void initState() {
    super.initState();
    _selectedGame = 0;
  }

  @override
  Widget build(BuildContext context) {
    _deviceWidth = MediaQuery.of(context).size.width;
    _deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          _featuredGamesWidget(),
          _gradientBoxWidget(),
          _topLayerWidget(),
        ],
      ),
    );
  }

  Widget _featuredGamesWidget() {
    return SizedBox(
      height: _deviceHeight * 0.4,
      width: _deviceWidth,
      child: PageView(
        onPageChanged: (_index) {
          setState(() {
            _selectedGame = _index;
          });
        },
        scrollDirection: Axis.horizontal,
        children: featuredGames.map((_game) {
          return Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(_game.coverImage.url))),
          );
        }).toList(),
      ),
    );
  }

  Widget _gradientBoxWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _deviceHeight * 0.9,
        width: _deviceWidth,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [primaryColor, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: [0.65, 1.0])),
      ),
    );
  }

  Widget _topLayerWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [_topBarWidget(),SizedBox(height: _deviceHeight*0.13,), _featuredGamesInfoWidget(),
        Padding(
          padding:EdgeInsets.symmetric(vertical: _deviceHeight*0.01),
          child: ScrollableGameWidget(height: _deviceHeight*0.22, width: _deviceWidth, showTitle: true, gamesData: games),
        ),
        _featuredGameBannerWidget(),
          ScrollableGameWidget(height: _deviceHeight*0.22 ,width: _deviceWidth, showTitle: false, gamesData: games2)
        ],
      ),
    );
  }

  Widget _topBarWidget() {
    return SizedBox(
      height: _deviceHeight * 0.13,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: (){},
            icon:Icon(Icons.menu,size: 30,),
            color: secondaryColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.search,
                color: secondaryColor,

                size: 30,
              ),
              SizedBox(
                width: 20,
              ),
              IconButton(
                onPressed: (){
                  Navigator.pushReplacement(context, SlidePageRoute(AnimatedProfile()));
                },
                icon: Icon(
                  Icons.logout,
                  color: secondaryColor,
                  size: 30,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _featuredGamesInfoWidget() {
    return SizedBox(
      height: _deviceHeight * 0.15,
      width: _deviceWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            featuredGames[_selectedGame].title,
            maxLines: 2,

            style: TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: _deviceHeight * 0.04,
              color: Colors.white,
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: featuredGames.map((_game) {
                bool _isActive= _game.title == featuredGames[_selectedGame].title;
                double _circleRadius = _deviceHeight * 0.004;
                return Container(
                  margin: EdgeInsets.only(right: _deviceWidth*0.01),
                  height: _circleRadius * 2,
                  width: _circleRadius * 2,
                  decoration: BoxDecoration(
                    color: _isActive?Colors.green:Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                );
              }).toList())
        ],
      ),
    );
  }
  Widget _featuredGameBannerWidget(){
    return Container(height:  _deviceHeight*0.13,
    width: _deviceWidth,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      image: DecorationImage(image: NetworkImage(featuredGames[2].coverImage.url),
          fit: BoxFit.cover,)
    ),);
  }

}