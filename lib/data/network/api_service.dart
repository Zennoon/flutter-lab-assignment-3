import 'dart:convert';
import 'dart:io';

import '../models/album.dart';
import '../models/photo.dart';
import '../models/user.dart';

class ApiService {
  final HttpClient httpClient;
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  ApiService(this.httpClient);

  Future<List<Album>> getAlbums() async {
    final uri = Uri.parse('$baseUrl/albums');
    final request = await httpClient.getUrl(uri);
    final response = await request.close();
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load albums');
    }
    final responseBody = await response.transform(utf8.decoder).join();
    final List<dynamic> jsonResponse = json.decode(responseBody);
    return (jsonResponse)
        .map((album) => Album.fromJson(album))
        .toList();
  }

  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    final uri = Uri.parse('$baseUrl/albums/$albumId/photos');
    final request = await httpClient.getUrl(uri);
    final response = await request.close();
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load photos');
    }
    final responseBody = await response.transform(utf8.decoder).join();
    final List<dynamic> jsonResponse = json.decode(responseBody);
    return (jsonResponse)
        .map((photo) => Photo.fromJson(photo))
        .toList();
  }

  Future<User> getUser(int userId) async {
    final uri = Uri.parse('$baseUrl/users/$userId');
    final request = await httpClient.getUrl(uri);
    final response = await request.close();
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load user');
    }
    final responseBody = await response.transform(utf8.decoder).join();
    final Map<String, dynamic> jsonResponse = json.decode(responseBody);
    return User.fromJson(jsonResponse);
  }
}
