import 'package:albums/presentation/widgets/album_description.dart';
import 'package:albums/presentation/widgets/photos_carousel.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/models/album.dart';
import '../../data/models/photo.dart';
import '../../data/models/user.dart';

class AlbumDetailScreen extends StatelessWidget {
  final Album album;
  final List<Photo> photos;
  final User user;
  const AlbumDetailScreen({super.key, required this.album, required this.photos, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Album details'),
        leading: IconButton(
          onPressed: () {
            context.go('/');
          },
          icon: Icon(
            Icons.arrow_back_ios
          )
        ),
      ),
      body: Column(
        children: [
          PhotosCarousel(photos: photos),
          SizedBox(height: 32),
          AlbumDescription(album: album, user: user)
        ],
      )
    );
  }
}