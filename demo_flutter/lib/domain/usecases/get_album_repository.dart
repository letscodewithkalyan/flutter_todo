import 'package:dartz/dartz.dart';
import 'package:demo_flutter/data/failure.dart';
import 'package:demo_flutter/domain/entities/album.dart';
import 'package:demo_flutter/domain/repositories/album_repository.dart';

class GetAlbum {
  final AlbumRepository repository;
  const GetAlbum({required this.repository});
  Future<Either<Failure, Album>> execute(String cityName) {
    return repository.getAlbum();
  }
}
