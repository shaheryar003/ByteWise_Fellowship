import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/fav_movies.dart';
import 'package:provider_practice/provider/movie_provider.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MoviewProvider>().movies;
    var mylist = context.watch<MoviewProvider>().mylist;
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: (() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => favMovies(),
                    ));
              }),
              icon: Icon(Icons.favorite),
              label: Text(
                "Go to My List (${mylist.length})",
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(vertical: 20)),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: movies.length,
                    itemBuilder: (_, index) {
                      final currentMovie = movies[index];
                      return Card(
                        key: ValueKey(currentMovie.title),
                        color: Colors.blue,
                        elevation: 4,
                        child: ListTile(
                          title: Text(
                            currentMovie.title,
                            style: TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            currentMovie.duration ?? "No Information",
                            style: TextStyle(color: Colors.white),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: mylist.contains(currentMovie)
                                  ? Colors.red
                                  : Colors.black,
                              size: 30,
                            ),
                            onPressed: () {
                              if (!mylist.contains(currentMovie)) {
                                context
                                    .read<MoviewProvider>()
                                    .addToList(currentMovie);
                              } else {
                                context
                                    .read<MoviewProvider>()
                                    .removeFromList(currentMovie);
                              }
                            },
                          ),
                        ),
                      );
                    }))
          ],
        ),
      ),
    );
  }
}
