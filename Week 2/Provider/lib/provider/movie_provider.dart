import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:provider_practice/models/movie_model.dart';

final List<Movie> initialData = List.generate(
    50,
    (index) => Movie(
        title: "Movie $index",
        duration: "${Random().nextInt(100) + 60} minutes"));

class MoviewProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;
  List<Movie> get movies => _movies;

  final List<Movie> _mylist = [];
  List<Movie> get mylist => _mylist;

  void addToList(Movie movie) {
    _mylist.add(movie);
    notifyListeners();
  }

  void removeFromList(Movie movie) {
    _mylist.remove(movie);
    notifyListeners();
  }
}
