import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamestore_ui/travel/travel_data.dart';

class TravelHome extends StatefulWidget {
  const TravelHome({super.key});

  @override
  State<TravelHome> createState() => _TravelHomeState();
}

class _TravelHomeState extends State<TravelHome> {
  List<String> _locations = ["Poluare", "Japan", "Moscow", "London"];
  int _activeLocaton = 1;
  late var size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        left: false,
        right: false,
        bottom: true,
        minimum: EdgeInsets.fromLTRB(
            size.width * 0.05, 0, size.width * 0.05, 0),
        child: _mainColumn(context),
      ),
    );
  }

  Widget _mainColumn(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        _appbar(),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.05),
          child: _locationBar(context),
        ),
        _articles(context)
      ],
    );
  }

  Widget _appbar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.menu, color: Colors.black, size: 35,),
        Container(
          height: 39,
          width: 144,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/logo_discover.png"))
          ),
        ),
        Icon(Icons.search, color: Colors.black, size: 35,),
      ],

    );
  }

  Widget _locationBar(BuildContext context) {
    return Container(
      height: size.height * 0.06,
      // padding: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black54,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _locations.map((location) {
          bool isActive = _locations[_activeLocaton] == location ? true : false;
          Color textColor = isActive ? Colors.white : Colors.white60;
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(location, style: TextStyle(
                  fontSize: 15, color: textColor, fontFamily: "Montserrat")),
              isActive ? Container(
                height: size.height * 0.005,
                width: size.width * 0.1,
                color: Colors.redAccent,
              ) : Container()
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _articles(BuildContext context) {
    return Expanded(child: ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return Stack(
          children: [Padding(
            padding: EdgeInsets.symmetric(horizontal:size.width * 0.005,vertical:size.width * 0.05 ),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.black38,
                        spreadRadius: 2,
                        blurRadius: 20,
                        offset: Offset(0, 6))
                  ],
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      image: NetworkImage(articles[index].image.toString()),
                      fit: BoxFit.cover)
              ),
              height: size.height * 0.30,
              child: _articleInfoColumn(context,index),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: size.height*0.26,left:size.width*0.1),
            child: _socialInfo(context, index),
          )],
        );
      },

    ));
  }

  Widget _articleInfoColumn(BuildContext context,int index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding:  EdgeInsets.fromLTRB(30,10,30,0),
          child: _authorInfo(context,index),
        ),
        Padding(padding: EdgeInsets.fromLTRB(30, size.height*0.05, 30, 0),child: _detailsRow(context,index),)
      ],
    );
  }

  Widget _authorInfo(BuildContext context,int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          
          children: [
            Container(
              width:50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white,width: 2),
                  image: DecorationImage(
                      image: NetworkImage("https://i.pravatar.cc/300"))
              ),
            ),
Padding(padding: EdgeInsets.only(left: 5),child:             Column(
  mainAxisSize: MainAxisSize.min,
  mainAxisAlignment: MainAxisAlignment.start,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [Text(articles[index].author,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),

    Text("3 hours ago",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),)],
)
  ,)
          ],
        ),
Column(children: [Icon(Icons.favorite_outlined,color: Colors.red,size: 20,),
  Padding(
    padding: EdgeInsets.only(top: 8.0),
    child: Icon(Icons.bookmark,color: Colors.white,size: 20,),
  )
],)
      ],
    );
  }
  Widget _detailsRow(BuildContext context,int index){
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        FloatingActionButton(onPressed: (){},
        backgroundColor: Colors.white,
          child: Icon(Icons.play_arrow,color: Colors.redAccent,size:30,),
          shape: CircleBorder(
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Container(
                width: size.width * 0.5,
                child: Text(articles[index].title,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 15,color: Colors.white),maxLines: 2,overflow: TextOverflow.ellipsis,)),
              Text(articles[index].location,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 13,color: Colors.white),overflow: TextOverflow.ellipsis,),
              _rating(context, index)
            ]
          ),
        ),

      ],


    );
  }
  Widget _socialInfo(BuildContext context , int index){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black38,
                spreadRadius: 2,
                blurRadius: 20,
                offset: Offset(0, 6))
          ],
        borderRadius: BorderRadius.circular(20)
      ),
      height: size.height*0.1,
      width: size.width * 0.7,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [Icon(Icons.favorite_outline,color: Colors.redAccent,size: 24,),Text(articles[index].likes.toString(),style: TextStyle(color: Colors.black45),)],
          ),
          Row(
            children: [Icon(Icons.mode_comment_outlined,color: Colors.redAccent,size: 24,),Text(articles[index].comments.toString(),style: TextStyle(color: Colors.black45),)],
          ),
          Row(
            children: [Icon(Icons.share,color: Colors.redAccent,size: 24,),Text(articles[index].shares.toString(),style: TextStyle(color: Colors.black45),)],
          )
        ],
      ),
    );
  }
  Widget _rating(BuildContext context , int index){
    return Row(
      children: List<Widget>.generate(5,(thisindex){
        Icon _starIcon;
        double _fillAmount = articles[index].rating - thisindex;
        if (_fillAmount>=1){
          _starIcon = Icon (Icons.star,color: Colors.amberAccent,size: 15,);

        }else if (_fillAmount>=0.5){
          _starIcon = Icon (Icons.star_half,color: Colors.amberAccent,size: 15,);
      }
      else{
    _starIcon = Icon (Icons.star_border,color: Colors.amberAccent,size: 15,);

    }
      return _starIcon;
      }),
    );
  }
}