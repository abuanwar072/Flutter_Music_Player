import 'package:flutter/material.dart';

class SongList extends StatelessWidget {
  SongList({@required this.songName, @required this.songDuration});

  final String songName;
  final double songDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: GestureDetector(
                  onTap: () {
                    // Do something when click the song name
                    Navigator.pushNamed(context, '/player');
                  },
                  child: Text(
                    '$songName',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Campton_Light'),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  songDuration.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    // Do something when click the menu
                  },
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          // width: MediaQuery.of(context).size.width * .8,
          padding: EdgeInsets.only(
            top: 10,
          ),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 1,
                color: Colors.grey[300],
              ),
            ),
          ),
        )
      ],
    );
  }
}
