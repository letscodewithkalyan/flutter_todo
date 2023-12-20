import 'package:bloc/bloc.dart';
import 'package:demo_flutter/domain/entities/album.dart';
import 'package:demo_flutter/domain/usecases/get_album_repository.dart';
import 'package:equatable/equatable.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final GetAlbum _getAlbum;
  AlbumBloc(this._getAlbum) : super(AlbumInitial()) {
    on<GetAlbumsEvent>(LoadAlbum);
  }

  Future<void> LoadAlbum(GetAlbumsEvent event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    var result = await _getAlbum.execute();
    result.fold((failure) => {emit(AlbumError(failure.message))},
        (data) => {emit(AlbumHasData(data))});
  }
}
