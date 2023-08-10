import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyappui/models/current_track_model.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children:  [
            const _TrackInfo(),
            const Spacer(),
            _PlayerControls(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800) const _MoreControls(),
            
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) return const SizedBox.shrink();
    return Row(
      children: [
        Image.asset(
          'images/lofi_girl_spotify.jpg',
          height: 60.0,
          width: 60.0,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4.0),
            Text(
              selected.artists,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.grey[300],
                    fontSize: 12.0,
                  ),
            ),
          ],
        ),
        const SizedBox(width: 12.0,),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
      ],
    );
  }
}

class _PlayerControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                onPressed: () {},
                icon: const Icon(Icons.shuffle),
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                onPressed: () {},
                icon: const Icon(Icons.skip_previous_outlined),
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 34.0,
                onPressed: () {},
                icon: const Icon(Icons.play_circle_outline),
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                onPressed: () {},
                icon: const Icon(Icons.skip_next_outlined),
              ),
              IconButton(
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                onPressed: () {},
                icon: const Icon(Icons.repeat),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '0:00',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(width: 8.0),
                Container(
                  height: 2.0,
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(2.5),
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(
                  selected?.duration ?? '0:00',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      IconButton(
        onPressed: () {},
         icon: const Icon(Icons.devices_outlined,),
         iconSize: 20.0,
         ),
         Row(
          children: [
            IconButton(
              onPressed: () {}
            , icon: const Icon(Icons.volume_up_outlined),
            ),
            Container(
              height: 5.0, 
              width: 70.0, 
              decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(2.5),),
               ),

          ],
         ),
         IconButton(
        onPressed: () {},
         icon: const Icon(Icons.fullscreen_exit_outlined,),
        
         ),
         
    ],);
  }
}