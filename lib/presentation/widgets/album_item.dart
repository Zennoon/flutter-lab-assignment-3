import 'package:flutter/material.dart';
import '../../data/models/album.dart';
import '../../data/models/photo.dart';
import '../../data/models/user.dart';
import 'package:go_router/go_router.dart';

class AlbumItem extends StatelessWidget {
  final Album album;
  final List<Photo> photos;
  final User user;

  const AlbumItem({ super.key, required this.album, required this.photos, required this.user });

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          context.go('/album/${album.id}', extra: {
            'album': album,
            'photos': photos,
            'user': user
          });
        },
        child: Padding (
          padding: EdgeInsets.all(8),
          child: Row(
            spacing: 20,
            children: [
              SizedBox(
                width: 100,
                child: Image.network('https://imgs.search.brave.com/92YRDoLfo8pjQDtxwbM4_UvoTTwOi9GSUWeSlFCrMR0/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/YWVzdGhldGljd2Fs/bGRlY29yLmNvbS9j/ZG4vc2hvcC9maWxl/cy9ud2Etc3RyYWln/aHQtb3V0dGEtY29t/cHRvbi1yYXAtbXVz/aWMtYWxidW0tY292/ZXItd2FsbC1hcnQt/cG9zdGVyLWFlc3Ro/ZXRpYy13YWxsLWRl/Y29yLmpwZz92PTE2/OTI1NTYwNjImd2lk/dGg9MTQ0NQ', fit: BoxFit.cover),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 4,
                      children: [
                        Text(album.title, style: Theme.of(context).textTheme.titleMedium),
                        Text('Music by ${user.name}.'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        TextButton(
                          child: const Text('View Details'),
                          onPressed: () {
                            context.go('/album/${album.id}', extra: {
                              'album': album,
                              'photos': photos,
                              'user': user
                            });
                          },
                        )
                      ],
                    ),
                  ],
                )
              )
            ],
          )
        )
      )
    );
  }
}
