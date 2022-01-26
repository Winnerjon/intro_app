import 'package:flutter/material.dart';
import 'package:intro_app/services/string_utils.dart';

import 'home_page.dart';

class IntroUiPage extends StatefulWidget {
  static const String id = "introui_page";

  const IntroUiPage({Key? key}) : super(key: key);

  @override
  _IntroUiPageState createState() => _IntroUiPageState();
}

class _IntroUiPageState extends State<IntroUiPage> {
  PageController controller = PageController(initialPage: 0);
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        actions: [
          (_selectedIndex != 2) ? TextButton(
            onPressed: () {
              setState(() {
                _selectedIndex = 2;
              });
              controller.animateToPage(
                  _selectedIndex, duration: Duration(milliseconds: 500),
                  curve: Curves.easeOutCubic);
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
          ) : TextButton(
            onPressed: () {
              Navigator.of(context).pushNamed(HomePage.id);
            },
            child: const Text(
              "Next",
              style: TextStyle(color: Colors.green, fontSize: 18),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
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
                image: "assets/images/img.png",
                titel: Strings.stepOneTitle,
                content: Strings.stepOneContent,
              ),
              makePage(
                image: "assets/images/img_1.png",
                titel: Strings.stepTwoTitle,
                content: Strings.stepTwoContent,
              ),
              makePage(
                image: "assets/images/img_2.png",
                titel: Strings.stepThreeTitle,
                content: Strings.stepThreeContent,
              ),
            ],
          ),
          //#indicators
          indicators(),
        ],
      ),
    );
  }

  Widget makePage({required String image, required titel, required content}) {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height,
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: Column(
        children: [
          //#image
          Expanded(
            flex: 5,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Image(
                image: AssetImage(image),
                height: 250,
                width: 250,
              ),
            ),
          ),
          //#titel content
          Expanded(
            flex: 4,
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  titel,
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: Text(
                    content,
                    style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget elementOfInticator(int index){
    return AnimatedContainer(
      height: 6,
      width: (index == _selectedIndex) ? 30 : 3,
      margin: EdgeInsets.only(right: 6),
      duration: Duration(milliseconds: 500),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(3)
      ),
    );
  }

  Widget indicators(){
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
