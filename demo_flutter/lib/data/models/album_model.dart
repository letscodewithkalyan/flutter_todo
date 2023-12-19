import 'package:demo_flutter/domain/entities/album.dart';

class AlbumModel {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  AlbumModel(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory AlbumModel.fromJson(Map<String, dynamic> json) {
    return AlbumModel(
        albumId: json['albumId'] as int,
        id: json['id'] as int,
        title: json['title'] as String,
        url: json['url'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String);
  }

  Album toEntity() => Album(
      albumId: albumId,
      id: id,
      title: title,
      url: url,
      thumbnailUrl: thumbnailUrl);
}
