import 'dart:convert';
import 'package:demo_flutter/domain/entities/album.dart';
import 'package:demo_flutter/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    futureAlbum = getAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
            child: Center(
                child: FutureBuilder<List<Album>>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return PhotosList(albums: snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
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

Future<List<Album>> getAlbums() async {
  final response =
      await http.get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
  if (response.statusCode == 200) {
    final parsed =
        (jsonDecode(response.body) as List).cast<Map<String, dynamic>>();
    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
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
