import 'package:flutter/material.dart';
import 'music_player.dart';
import 'widgets/album_cover.dart';
import 'widgets/top_app_bar.dart';
import 'widgets/song_list.dart';
import 'constant/constant.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: Color(0xFF7D9AFF),
        accentColor: Color(0xFF7D9AFF),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/player': (context) => MusicPlayer(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              AlbumCover(),
              TopAppBAr(
                iconName: Icons.menu,
              ),
              ArtistName(),
              Positioned(
                bottom: -25,
                right: 30,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFF7D9AFF),
                  onPressed: () {
                    // Todo What you want to
                  },
                  child: Icon(Icons.play_arrow),
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Popular',
                      style: Ktitle,
                    ),
                    Text(
                      'Show All',
                      style: kShowAllText,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    children: <Widget>[
                      SongList(
                        songName: 'No tears to cry',
                        songDuration: 5.20,
                      ),
                      SongList(
                        songName: 'Imagine',
                        songDuration: 3.20,
                      ),
                      SongList(
                        songName: 'Into you',
                        songDuration: 4.12,
                      ),
                      // SongList(
                      //   songName: 'One lasr time',
                      //   songDuration: 4.55,
                      // )
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
