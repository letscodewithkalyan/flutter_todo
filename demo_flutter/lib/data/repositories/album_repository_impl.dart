import 'package:dartz/dartz.dart';
import 'package:demo_flutter/data/ServerException.dart';
import 'package:demo_flutter/data/datasources/album_data_source.dart';
import 'package:demo_flutter/data/failure.dart';
import 'package:demo_flutter/domain/entities/album.dart';
import 'package:demo_flutter/domain/repositories/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource albumDataSource;
  AlbumRepositoryImpl({required this.albumDataSource});
  @override
  Future<Either<Failure, Album>> getAlbum() async {
    try {
      final result = await albumDataSource.getAlbums();
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on Exception {
      return Left(ServerFailure(''));
    }
  }
}
