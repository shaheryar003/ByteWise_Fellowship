import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_practice/homescreen.dart';
import 'package:provider_practice/provider/movie_provider.dart';

void main() {
  runApp(ChangeNotifierProvider<MoviewProvider>(
    child: MyApp(),
    create: (_) => MoviewProvider(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const homeScreen(),
    );
  }
}
