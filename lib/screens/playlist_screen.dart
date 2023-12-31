import 'package:flutter/material.dart';
import 'package:spotifyappui/data/data.dart';
import 'package:spotifyappui/widgets/tracks_list.dart';

import '../widgets/playlist_header.dart';

class PlaylistScreen extends StatefulWidget {
  
   final Playlist playlist;
    // ignore: prefer_const_constructors_in_immutables
   PlaylistScreen({
    Key? key,
    
    required this.playlist,
   }): super(key: key);

  @override

  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _scrollController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 140.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal:16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
                child: const Icon(Icons.chevron_left, size: 28.0,),
                ),
              ),
              const SizedBox(width: 16.0,),
              InkWell(
                customBorder: CircleBorder(),
                onTap: () {},
                child: Container(padding: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
                child: const Icon(Icons.chevron_right, size: 28.0,),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton.icon(onPressed: () {},
          style: TextButton.styleFrom(primary: Theme.of(context).iconTheme.color),
           icon: const Icon(Icons.account_circle_outlined,size: 30.0,), 
           label:const Text('Pradestha Pp'),
           ),
           const SizedBox(width: 8.0,),
           IconButton(
            padding: const EdgeInsets.only(),
            onPressed: () {},
            icon: const Icon(Icons.keyboard_arrow_down,size: 30.0,),
            ),
           ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
           end: Alignment.bottomCenter,
            colors: [
            const Color(0xFFAF1018),
            Theme.of(context).backgroundColor,
          ],
          stops: const [0,0.3],
          ),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 16.0,
              ),
              children: [
                PlaylistHeader(playlist:widget.playlist),
                TrackList(tracks: widget.playlist.songs),
              ],
          ),
          ),
      ),
    );
  }
}