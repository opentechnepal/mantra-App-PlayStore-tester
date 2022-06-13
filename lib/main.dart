import 'package:flutter/material.dart';
import 'screens/song_list_screen.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  static final String title = 'Nepali Songs And Chords';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
          primarySwatch: Colors.blue),
        home: SongListScreen(),
      );
}
