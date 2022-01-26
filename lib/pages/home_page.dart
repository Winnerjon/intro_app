import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_app/pages/introui_page.dart';
import 'package:intro_app/pages/introui_task_page.dart';

class HomePage extends StatefulWidget {
  static const String id = "home_page";

  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade600,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              height: 45,
              minWidth: 250,
              color: Colors.purple,
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.of(context).pushNamed(IntroUiPage.id);
              },
              child: Text(
                "Intro Ui",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20,),
            MaterialButton(
              height: 45,
              minWidth: 250,
              color: Colors.purple,
              shape: StadiumBorder(),
              onPressed: () {
                Navigator.of(context).pushNamed(IntroUiTaskPage.id);
              },
              child: Text(
                "Intro Ui Task",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
