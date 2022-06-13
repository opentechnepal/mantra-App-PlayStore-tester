import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nepali_lyricapp_upgraded/screens/song_details_screen.dart';
import '../data/songs_list.dart';
import '../main.dart';
import '../model/songsModel.dart';
import '../widgets/nav_drawer.dart';
import '../widgets/search_widget.dart';


class SongListScreen extends StatefulWidget {
  const SongListScreen({Key? key}) : super(key: key);

  @override
  SongListScreenState createState() => SongListScreenState();
}

class SongListScreenState extends State<SongListScreen> {
  late List<Songs> songs;
  String query = '';

  @override
  void initState() {
    super.initState();
    // to initlize the list
    songs = songList;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
          centerTitle: true,
        ),
        drawer: const NavigationDrawer(),
        body: Column(
          children: <Widget>[
            buildSearch(),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  // to sort Songs by search
                  final toSort = songs;
                  final sortedSongs = toSort
                    ..sort((a, b) => a.title.compareTo(b.title));
                  final song = sortedSongs[index];

                  // previous songs
                  //final song = songs[index];
                  return buildSongs(song);
                },
              ),
            ),
          ],
        ),
      );

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: 'Song or Artist Name',
        onChanged: searchSongs,
      );

//   This is the List View - Font Page Of The App (with all the ui rendaring) Main Page
  Widget buildSongs(Songs song) => Card(
    child: ListTile(
          title: Text(song.title),
          subtitle: Text(song.artist),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Container(
              width: 85,
              height: 90,
              color: Colors.blue[100],
              child: CachedNetworkImage(
                  imageUrl: (song.ImageUrl),
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.image_not_supported_outlined)),
            ),
          ),
          trailing: const Icon(Icons.navigate_next_sharp),
          contentPadding: const EdgeInsets.all(3),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SongsDetailScreen(song),
              ),
            );
          },
        ),
  );

// This is the search quary funtion of the app (Logic)
  void searchSongs(String query) {
    final songs = songList.where((book) {
      final titleLower = book.title.toLowerCase();
      final artistLower = book.artist.toLowerCase();
      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower) ||
          artistLower.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.songs = songs;
    });
  }
}
