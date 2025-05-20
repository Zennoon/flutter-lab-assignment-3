import 'package:flutter_bloc/flutter_bloc.dart';
import 'album_event.dart';
import 'album_state.dart';
import '../../data/network/retrofit_service.dart';
import '../../data/models/album.dart';
import '../../data/models/photo.dart';
import '../../data/models/user.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final ApiService apiService;

  AlbumBloc(this.apiService) : super(AlbumInitial()) {
    on<FetchAlbums>((event, emit) async {
      emit(AlbumLoading());
      try {
        final albums = await apiService.getAlbums();

        final detailedAlbums = await Future.wait(albums.map((album) async {
          final photos = await apiService.getPhotosByAlbumId(album.id);
          final user = await apiService.getUser(album.userId);

          return {
            'album': album,
            'photos': photos,
            'user': user
          };
        }));

        emit(AlbumSuccess(detailedAlbums));
      } catch (e) {
        emit(AlbumError('Failed to load albums'));
      }
    });
  }
}
