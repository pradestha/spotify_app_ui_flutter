import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotifyappui/data/data.dart';
import 'package:spotifyappui/models/current_track_model.dart';

class TrackList extends StatelessWidget {
  final List<Song> tracks;

  const TrackList({
    Key? key,
    required this.tracks,
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      headingTextStyle: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12.0),
      // ignore: deprecated_member_use
      dataRowHeight: 54.0,
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((e) {
        final selected = context.watch<CurrentTrackModel>().selected?.id == e.id ;
        // ignore: unused_local_variable
       
        final textStyle =  TextStyle(
         color: selected ? Theme.of(context).colorScheme.tertiary : Theme.of(context).iconTheme.color,
        );
        return DataRow(cells: [
          DataCell(
            Text(e.title, 
          style: textStyle,
          ),
          ),
           DataCell(
            Text(e.artists, 
          style: textStyle,
          ),
          ),
           DataCell(
            Text(e.album, 
            style: textStyle,
          ),
          ),
           DataCell(
            Text(e.duration, 
          style: TextStyle(color: Theme.of(context).iconTheme.color),
          ),
          ),
        ],
        selected: selected,
        onSelectChanged: (_) =>
        context.read<CurrentTrackModel>().selectTrack(e),
        );
      }).toList(),
    );
  }
}

