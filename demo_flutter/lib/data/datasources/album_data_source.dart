import 'dart:convert';

import 'package:demo_flutter/data/ServerException.dart';
import 'package:demo_flutter/data/constants.dart';
import 'package:demo_flutter/data/models/album_model.dart';
import 'package:http/http.dart' as http;

abstract class AlbumDataSource {
  Future<AlbumModel> getAlbums();
}

class AlbumDataSourceImpl extends AlbumDataSource {
  final http.Client client;
  AlbumDataSourceImpl({required this.client});
  @override
  Future<AlbumModel> getAlbums() async {
    final response = await client.get(Uri.parse(Urls.albumDataSource));
    if (response.statusCode == 200) {
      return AlbumModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
