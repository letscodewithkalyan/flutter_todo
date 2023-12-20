import 'dart:convert';

import 'package:demo_flutter/data/ServerException.dart';
import 'package:demo_flutter/data/constants.dart';
import 'package:demo_flutter/data/models/album_model.dart';
import 'package:http/http.dart' as http;

abstract class AlbumDataSource {
  Future<List<AlbumModel>> getAlbums();
}

class AlbumDataSourceImpl extends AlbumDataSource {
  final http.Client client;
  AlbumDataSourceImpl({required this.client});
  @override
  Future<List<AlbumModel>> getAlbums() async {
    final response = await client.get(Uri.parse(Urls.albumDataSource));
    if (response.statusCode == 200) {
      final parsed =
          (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
      return parsed
          .map<AlbumModel>((json) => AlbumModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
