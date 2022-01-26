import 'package:flutter/material.dart';
import 'package:intro_app/pages/home_page.dart';
import 'package:intro_app/services/string_utils.dart';

class IntroUiTaskPage extends StatefulWidget {
  static const String id = "introui_task_page";

  const IntroUiTaskPage({Key? key}) : super(key: key);

  @override
  _IntroUiTaskPageState createState() => _IntroUiTaskPageState();
}

class _IntroUiTaskPageState extends State<IntroUiTaskPage> {
  PageController controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            children: [
              makePage(
                image: "assets/images/img_3.png",
                titel: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: "assets/images/img_5.png",
                titel: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
              makePage(
                image: "assets/images/img_4.png",
                titel: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          indicators(),
      (_selectedIndex != 2) ? Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 10, bottom: 60),
            child: TextButton(
              onPressed: () {
                setState(() {
                  _selectedIndex = 2;
                });
                controller.animateToPage(
                    _selectedIndex, duration: Duration(milliseconds: 500),
                    curve: Curves.easeOutCubic);
              },
              child: Text(
                "Skip",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ):Container(
        alignment: Alignment.bottomRight,
        padding: EdgeInsets.only(right: 10, bottom: 60),
        child: TextButton(
          onPressed: (){
            Navigator.of(context).pushNamed(HomePage.id);
          },
          child: Text(
            "Next",
            style: TextStyle(
                color: Colors.red,
                fontSize: 17,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
        ],
      ),
    );
  }

  Widget makePage({required String image, required titel, required content}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            titel,
            style: TextStyle(
                color: Colors.red, fontSize: 33, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              content,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(image),
            )),
          ),
        ],
      ),
    );
  }

  Widget elementOfInticator(int index) {
    return AnimatedContainer(
      height: 6,
      width: (index == _selectedIndex) ? 30 : 3,
      margin: EdgeInsets.only(right: 6),
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(3)),
    );
  }

  Widget indicators() {
    return Container(
      padding: EdgeInsets.only(bottom: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          elementOfInticator(0),
          elementOfInticator(1),
          elementOfInticator(2),
        ],
      ),
    );
  }
}
