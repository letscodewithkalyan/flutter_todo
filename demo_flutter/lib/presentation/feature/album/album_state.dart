part of 'album_bloc.dart';

sealed class AlbumState extends Equatable {
  const AlbumState();

  @override
  List<Object> get props => [];
}

final class AlbumInitial extends AlbumState {}

final class AlbumLoading extends AlbumState {}

final class AlbumError extends AlbumState {
  final String errorMessage;
  const AlbumError(this.errorMessage);
}

final class AlbumHasData extends AlbumState {}
