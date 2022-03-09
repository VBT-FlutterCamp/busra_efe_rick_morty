import 'package:flutter/material.dart';
import 'package:rick_and_morty/rick_morty/rickmorty.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: RickMorty(),
    );
  }
}
