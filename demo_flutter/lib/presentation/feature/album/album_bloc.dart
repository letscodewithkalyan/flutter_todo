import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial()) {
    on<GetAlbumsEvent>(LoadAlbum);
  }

  Future<void> LoadAlbum(GetAlbumsEvent event, Emitter<AlbumState> emit) async {
    emit(AlbumLoading());
    var result =
  }
}
