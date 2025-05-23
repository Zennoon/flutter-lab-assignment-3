import 'package:go_router/go_router.dart';
import '../presentation/screens/album_list_screen.dart';
import '../presentation/screens/album_detail_screen.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => AlbumListScreen()
    ),
    GoRoute(
      path: '/album/:id',
      builder: (context, state) {
        final albumMap = state.extra as Map<String, dynamic>;

        return AlbumDetailScreen(
          album: albumMap['album'],
          photos: albumMap['photos'],
          user: albumMap['user'],
        );
      }
    )
  ]
);
