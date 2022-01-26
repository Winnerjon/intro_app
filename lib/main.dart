import 'package:flutter/material.dart';
import 'package:intro_app/pages/home_page.dart';
import 'package:intro_app/pages/introui_page.dart';
import 'package:intro_app/pages/introui_task_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "intro ui",
      theme: ThemeData(
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
        ),
      ),
      home: HomePage(),
      routes: {
        IntroUiPage.id:(context)=>IntroUiPage(),
        HomePage.id:(context)=>HomePage(),
        IntroUiTaskPage.id:(context)=>IntroUiTaskPage(),
      },
    );
  }

}
