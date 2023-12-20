import 'package:dartz/dartz.dart';
import 'package:demo_flutter/data/failure.dart';
import 'package:demo_flutter/domain/entities/album.dart';
import 'package:demo_flutter/domain/repositories/album_repository.dart';

class GetAlbum {
  final AlbumRepository repository;
  const GetAlbum(this.repository);
  Future<Either<Failure, List<Album>>> execute() {
    return repository.getAlbum();
  }
}
