import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:music_player/constant/constant.dart';
import 'package:music_player/widgets/top_app_bar.dart';

class MusicPlayer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          BlurBackground(),
          TopAppBAr(
            iconName:
                Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios,
          ),
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 100),
            width: double.infinity,
            // color: Colors.teal,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(48), topRight: Radius.circular(48)),
            ),
            child: Column(
              children: <Widget>[
                ArtistPhoto(),
                ProcessBar(),
                SongsDuration(),
                SongsName(),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Icon(
                        Icons.fast_rewind,
                        size: 30,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.withOpacity(.5),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(25),
                          child: Icon(
                            Icons.pause,
                            size: 30,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.fast_forward,
                        size: 30,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SongsName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        children: <Widget>[
          Text(
            'No tears left to cry',
            style: Ktitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Ariana Grande',
            style: kShowAllText,
          ),
        ],
      ),
    );
  }
}

class SongsDuration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '3.52',
            style: kDuration,
          ),
          Text(
            '5.20',
            style: kDuration,
          ),
        ],
      ),
    );
  }
}

class ProcessBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 2.5,
      width: MediaQuery.of(context).size.width - 20,
      child: LinearProgressIndicator(
        value: .7,
        valueColor: AlwaysStoppedAnimation<Color>(
          Color(0xFF7D9AFF),
        ),
        backgroundColor: Colors.grey.withOpacity(0.2),
      ),
    );
  }
}

class ArtistPhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30, bottom: 20),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        image: DecorationImage(
          image: AssetImage('assets/images/ariana_grande_artist_photo_3.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class BlurBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .6,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage(
              'assets/images/ariana_grande_cover_no_tears_left_to_cry.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.0),
          ),
        ),
      ),
    );
  }
}
