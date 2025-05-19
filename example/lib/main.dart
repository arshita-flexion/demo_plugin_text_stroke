import 'package:demo_plugin_text_stroke/text_rich_stroke.dart';
import 'package:demo_plugin_text_stroke/text_stroke.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(20.0),
          physics: BouncingScrollPhysics(),
          children: [
            Center(
              child: TextStroke(
                text: "Text stroke",
                strokeColor: Colors.green,
                strokeWidth: 2.0,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 50.0),
              ),
            ),
            Center(
              child: TextRichStroke(
                strokeColor: Colors.pink,
                textSpan: TextSpan(
                  text: "Text rich",
                  style: TextStyle(color: Colors.white, fontSize: 30.0),

                  children: [TextSpan(text: " "), TextSpan(text: "Stroke", style: TextStyle(color: Colors.green))],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
