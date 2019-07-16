import 'package:flutter/material.dart';
import 'package:flutter_car_rent_ui/ChooseCar.dart';
import 'package:page_view_indicator/page_view_indicator.dart';

class intro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pageIndexNotifier = ValueNotifier<int>(0);

  PageViewIndicator CustomIndicator(int length) {
    return PageViewIndicator(
      pageIndexNotifier: pageIndexNotifier,
      length: length,
      normalBuilder: (animationController, index) => Circle(
            size: 8.0,
            color: Colors.grey,
          ),
      highlightedBuilder: (animationController, index) => ScaleTransition(
            scale: CurvedAnimation(
              parent: animationController,
              curve: Curves.ease,
            ),
            child: Circle(
              size: 12.0,
              color: Colors.black,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color color1 = Color(0xFFD2A560);
    List<Color> intro1ColorGold = [
      Color(0xFFE2B867),
      Color(0xFFDAAE63),
      Color(0xFFD2A560),
      Color(0xFFD2A560),
    ];
    List<Color> introWHite = [
      Color(0xFFFFFFFF),
      Color(0xFFFFFFFF),
      Color(0xFFFFFFFF),
      Color(0xFFFFFFFF),
    ];
    List<Widget> pages = [
      introPage1(
          'images/car_white.png',
          'TOP BRANDS',
          'Sports cars premium sedans\nand SUVs: Our vehicles are highly\nexclusive and always equipped\nwith the latest technology.',
          introWHite,
          color1,
          Colors.black,
          'SKIP',
          context),
      introPage1(
          'images/car_gold.png',
          'BRAND NEW',
          'Sports cars, premium sedans\nand SUVs: Our vehicles are highly\nexclusive and always equipped\nwith the latest technology.',
          intro1ColorGold,
          Colors.white,
          Colors.white,
          'SKIP',
          context),
      introPage1(
          'images/car_white2.png',
          'FULL SERVICE',
          'Extras, additional services and\nexpert advice: Sports & Luxury Cars\nhas a solution for all questions\nrelated to luxury car hire.',
          introWHite,
          color1,
          Colors.black,
          'Start',
          context),
    ];

    return Stack(
      alignment: FractionalOffset.bottomCenter,
      children: <Widget>[
        Container(
          height: double.maxFinite,
          child: PageView.builder(
              onPageChanged: (index) => pageIndexNotifier.value = index,
              itemCount: pages.length,
              itemBuilder: (context, position) => pages[position]),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 50),
          child: CustomIndicator(pages.length),
        )
      ],
    );
  }
}

Widget introPage1(String image, String title, String des, List<Color> color,
    Color skip, Color text, skipText, BuildContext context) {
  Color color1 = Color(0xFFF2E9DC);
  return Material(
    child: Container(
        decoration: BoxDecoration(
          // Box decoration takes a gradient
          gradient: LinearGradient(
            // Where the linear gradient begins and ends
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            // Add one stop for each color. Stops should increase from 0 to 1
            stops: [0.1, 0.5, 0.7, 0.9],
            colors: color,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100, right: 30),
              child: Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChooseCarScreen();
                      }));
                    },
                    child: Text(
                      skipText,
                      style: TextStyle(
                          color: skip,
                          fontWeight: FontWeight.w300,
                          fontSize: 18),
                    ),
                  )),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, left: 30),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      child: Image.asset(
                        image,
                        height: 200,
                        width: 200,
                      ),
                      decoration:
                          BoxDecoration(shape: BoxShape.circle, color: color1),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, left: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  title,
                  style: TextStyle(
                      color: text, fontSize: 50, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  des,
                  style: TextStyle(
                      color: text, fontSize: 18, fontWeight: FontWeight.w100),
                ),
              ),
            )
          ],
        )),
  );
}
