import 'package:clone_youtubestudio/bottom_nav.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primarySwatch: Colors.red, backgroundColor: Colors.white),
      home: YoutubeStudioBNB(),
      debugShowCheckedModeBanner: false,
    );
  }
}
