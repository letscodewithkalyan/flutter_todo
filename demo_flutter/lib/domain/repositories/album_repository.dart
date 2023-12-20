import 'package:dartz/dartz.dart';
import 'package:demo_flutter/data/failure.dart';
import 'package:demo_flutter/domain/entities/album.dart';

abstract class AlbumRepository {
  Future<Either<Failure, List<Album>>> getAlbum();
}
