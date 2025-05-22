import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/network/http_client.dart';
import 'data/network/api_service.dart';
import 'logic/albums/album_bloc.dart';
import 'logic/albums/album_event.dart';
import 'router/app_router.dart';
import 'theme/theme.dart';
import 'theme/util.dart';

void main() {
  final apiService = ApiService(httpClient);
  runApp(MyApp(apiService: apiService));
}

class MyApp extends StatelessWidget {
  final ApiService apiService;
  const MyApp({super.key, required this.apiService});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = createTextTheme(context, 'Comfortaa', 'Comfortaa');
    MaterialTheme theme = MaterialTheme(textTheme);

    return BlocProvider(
      create: (_) => AlbumBloc(apiService)..add(FetchAlbums()),
      child: MaterialApp.router(
        title: 'Albums',
        theme: theme.light(),
        darkTheme: theme.dark(),
        themeMode: ThemeMode.system,
        routerConfig: router,
      ),
    );
  }
}