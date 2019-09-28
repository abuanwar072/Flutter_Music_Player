import 'package:flutter/material.dart';
import '../constant/constant.dart';

class AlbumCover extends StatelessWidget {
  const AlbumCover({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .6,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
        ),
        image: DecorationImage(
          image: AssetImage(
              'assets/images/ariana_grande_cover_no_tears_left_to_cry.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class ArtistName extends StatelessWidget {
  const ArtistName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .6,
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            children: <Widget>[
              Positioned(
                bottom: 170,
                child: Text(
                  'Tranding',
                  style: kTrandingText,
                ),
              ),
              Positioned(
                bottom: 80,
                child: Text(
                  'Ariana',
                  style: kArtistNameText,
                ),
              ),
              Positioned(
                bottom: 20,
                child: Text(
                  'Grande',
                  style: kArtistNameText,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
