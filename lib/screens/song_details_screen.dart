import 'package:flutter/material.dart';
import '../model/songsModel.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SongsDetailScreen extends StatelessWidget {
  final Songs songs;
  SongsDetailScreen(this.songs);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/paper-medium-min.jpg"),
          fit: BoxFit.cover,
          // colorFilter: ColorFilter.mode(
          //   Colors.blue.withOpacity(0.9),
          //   BlendMode.color
          // ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            songs.title,
            style: const TextStyle(wordSpacing: 1.6),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: 190,
                    width: double.infinity,
                    child: CachedNetworkImage(
                      imageUrl: (songs.ImageUrl),
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.library_music_outlined),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 7,
                ),
                // Song Name 
                Text(
                  songs.title,
                  style: const TextStyle(
                      fontFamily: "Oswald",
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                // Artist
                Text(
                  songs.artist,
                  style: const TextStyle(
                      fontFamily: "Oswald",
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                // Year
                Text(
                  'Year ' + songs.year.toString(),
                  style: const TextStyle(
                      fontFamily: "Oswald",
                      fontSize: 15.0,
                      fontWeight: FontWeight.w600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 9,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Text(
                        songs.description,
                        style: const TextStyle(
                          fontFamily: "Dosis",
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
