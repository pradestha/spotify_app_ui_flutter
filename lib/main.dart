import 'package:flutter/material.dart';
import 'package:spotifyappui/data/data.dart';
import 'package:spotifyappui/models/current_track_model.dart';
import 'package:spotifyappui/screens/playlist_screen.dart';
import 'package:provider/provider.dart';
import 'package:spotifyappui/widgets/current_track.dart';



import 'widgets/side_menu.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CurrentTrackModel(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
       backgroundColor: (Colors.black), 
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: const Color(0xFF121212),
        primaryColor: Colors.black,
        hintColor: const Color(0XFF1DB954),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        // fontFamily: 'Montserrat',
        textTheme: TextTheme(
          displayMedium: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: TextStyle(
            fontSize: 12.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w500,
            letterSpacing: 2.0,
          ),
          bodyLarge: TextStyle(
            fontSize: 14.0,
            color: Colors.grey[300],
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyMedium: TextStyle(
            color: Colors.grey[300],
            letterSpacing: 1.0,
          ),
        ), 
        //colorScheme: ColorScheme(background: const Color(0xFF121212), brightness:Brightness.light, onPrimary:  ),
      ),
      home: const Shell(),
    );
  }
}

class Shell extends StatelessWidget {
  const Shell({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                 if (MediaQuery.of(context).size.width > 800) SideMenu(),
                 Expanded(
                  child: PlaylistScreen(playlist: lofihiphopMusic),
                  ),
              ],
            ),
          ),
          const CurrentTrack(),
        ],
      ),
    );
  }
}
