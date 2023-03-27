import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/provider/movie_provider.dart';

class favMovies extends StatefulWidget {
  const favMovies({super.key});

  @override
  State<favMovies> createState() => _favMoviesState();
}

class _favMoviesState extends State<favMovies> {
  @override
  Widget build(BuildContext context) {
    final _mylist = context.watch<MoviewProvider>().mylist;
    return Scaffold(
      appBar: AppBar(
        title: Text("My List (${_mylist.length})"),
      ),
      body: ListView.builder(
          itemCount: _mylist.length,
          itemBuilder: (_, index) {
            final currentMovie = _mylist[index];
            return Card(
              key: ValueKey(currentMovie.title),
              elevation: 4,
              child: ListTile(
                  title: Text(
                    currentMovie.title,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    currentMovie.duration ?? "",
                    style: TextStyle(color: Colors.black),
                  ),
                  trailing: TextButton(
                      onPressed: () {
                        context
                            .read<MoviewProvider>()
                            .removeFromList(currentMovie);
                      },
                      child: Text(
                        "Remove",
                        style: TextStyle(color: Colors.red),
                      ))),
            );
          }),
    );
  }
}
