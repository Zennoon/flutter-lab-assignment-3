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
            return Center(child: Text(state.message));
          }
          return Container();
        }
      ),
    );
  }
}
