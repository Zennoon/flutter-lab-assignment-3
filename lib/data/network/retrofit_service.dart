import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../models/album.dart';
import '../models/photo.dart';
import '../models/user.dart';

part 'retrofit_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, { String? baseUrl }) = _ApiService;

  @GET('/albums')
  Future<List<Album>> getAlbums();

  @GET('/albums/{id}/photos')
  Future<List<Photo>> getPhotosByAlbumId(@Path('id') int albumId);

  @GET('/users/{id}')
  Future<User> getUser(@Path('id') int userId);
}
