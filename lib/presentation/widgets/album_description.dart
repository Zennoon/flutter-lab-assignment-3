import 'package:flutter/material.dart';
import '../../data/models/album.dart';
import '../../data/models/user.dart';

class AlbumDescription extends StatelessWidget {
  final Album album;
  final User user;
  const AlbumDescription({super.key, required this.album, required this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(album.title, style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.center),
            SizedBox(height: 16),
            Text('Music by ${user.name}', style: Theme.of(context).textTheme.bodyLarge),
            SizedBox(height: 16),
            Text('Contact', style: Theme.of(context).textTheme.bodyLarge),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}')
          ]
        ),
      )
    );
  }
}