import 'package:albums/logic/albums/album_event.dart';
import 'package:albums/presentation/widgets/album_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/albums/album_bloc.dart';
import '../../logic/albums/album_state.dart';

class AlbumListScreen extends StatelessWidget {
  const AlbumListScreen({ super.key });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Albums')),
      body: BlocBuilder<AlbumBloc, AlbumState>(
        builder: (context, state) {
          if (state is AlbumLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is AlbumSuccess) {
            return ListView.separated(
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final albumMap = state.albums[index];
                return AlbumItem(
                  album: albumMap['album'],
                  photos: albumMap['photos'],
                  user: albumMap['user'],
                );
              },
              padding: EdgeInsets.all(12),
              physics: BouncingScrollPhysics(),
              separatorBuilder: (_, _) => SizedBox(height: 12),
              shrinkWrap: true
            );
          }
          if (state is AlbumError) {
            return Center(
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(state.message, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.error
                  )),
                  ElevatedButton(onPressed: () {
                      print('Clicked');
                      context.read<AlbumBloc>().add(FetchAlbums());
                    },
                      child: Text('Retry')
                  )
                ],
              )
            );
          }
          return Container();
        }
      ),
    );
  }
}
