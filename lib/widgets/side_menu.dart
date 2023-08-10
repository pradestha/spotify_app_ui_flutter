import 'package:flutter/material.dart';

import '../data/data.dart';

class SideMenu extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  return Container(
                  height: double.infinity,
                  width: 280.0,
                  color: Theme.of(context).primaryColor,
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Image.asset(
                            'images/spotify_logoo.jpeg',
                            height: 120.0,
                            filterQuality: FilterQuality.medium,
                            ),
                        ),
                      ],
                    ),
                    _SideMenuIconTab(
                      iconData: Icons.home,
                      title: 'Home',
                      onTap: () {},
                    ),
                    _SideMenuIconTab(
                      iconData: Icons.search,
                      title: 'Search',
                      onTap: () {},
                    ),
                    _SideMenuIconTab(
                      iconData: Icons.audiotrack,
                      title: 'Radio',
                      onTap: () {},
                    ),
                    const SizedBox(height: 12.0),
                    _LibraryPlaylists(),
                  ],),
                );
}
}

class _SideMenuIconTab extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onTap;
  const _SideMenuIconTab({
    super.key,
    required this.iconData,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        iconData,
        color: Theme.of(context).iconTheme.color,
        size: 28.0,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyText1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: onTap,
    );
  }
}

class _LibraryPlaylists extends StatefulWidget {
  const _LibraryPlaylists({super.key});

  @override
  State<_LibraryPlaylists> createState() => __LibraryPlaylistsState();
}

class __LibraryPlaylistsState extends State<_LibraryPlaylists> {
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
    return Expanded(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController ,
      child: ListView(
        controller: _scrollController,
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        physics: const ClampingScrollPhysics(),
        children:[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'YOUR LIBRARY', 
              style: Theme.of(context).textTheme.headline4,
              overflow: TextOverflow.ellipsis,
              ),
          ),
          ...yourLibrary.map(
            (e) => ListTile(
              dense: true,
              title: Text(e,
              style: Theme.of(context).textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
              ),
              onTap: () {},
              ),
          ).toList(),
        ],
      ),
     const SizedBox(height: 24.0,),
     Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              'PLAYLISTS', 
              style: Theme.of(context).textTheme.headline4,
              overflow: TextOverflow.ellipsis,
              ),
          ),
          ...Playlists.map(
            (e) => ListTile(
              dense: true,
              title: Text(e,
              style: Theme.of(context).textTheme.bodyText2,
              overflow: TextOverflow.ellipsis,
              ),
              onTap: () {},
              ),
          ).toList(),
        ],
      ), 
    ],
    ),
    ),
    );
  }
}