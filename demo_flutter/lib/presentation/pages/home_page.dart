import 'package:demo_flutter/domain/entities/album.dart';
import 'package:demo_flutter/presentation/feature/album/album_bloc.dart';
import 'package:demo_flutter/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Album>> futureAlbum;

  @override
  void initState() {
    super.initState();
    context.read<AlbumBloc>().add(GetAlbumsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(child: Center(child: BlocBuilder<AlbumBloc, AlbumState>(
          builder: (context, state) {
            if (state is AlbumLoading) {
              return const CircularProgressIndicator();
            } else if (state is AlbumHasData) {
              return PhotosList(albums: state.result);
            } else if (state is AlbumError) {
              return Text(state.errorMessage);
            }
            return const CircularProgressIndicator();
          },
        ))),
        GradientButton(
            text: 'Navigate to Weather',
            onPressed: () => {Navigator.pushNamed(context, '/weather')}),
      ]),
    );
  }
}

class PhotosList extends StatelessWidget {
  final List<Album> albums;
  const PhotosList({super.key, required this.albums});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return Image.network(albums[index].url);
        });
  }
}
