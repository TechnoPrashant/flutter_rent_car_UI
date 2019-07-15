import 'package:flutter/material.dart';
import 'package:flutter_car_rent_ui/utility/UtilityString.dart';

class Car extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CarDetailsScreen(),
    );
  }
}

class CarDetailsScreen extends StatefulWidget {
  @override
  _CarDetailsScreenState createState() => _CarDetailsScreenState();
}

class _CarDetailsScreenState extends State<CarDetailsScreen> {
  List<Color> intro1ColorGold = [
    Color(0xFFE2B867),
    Color(0xFFDAAE63),
    Color(0xFFD2A560),
    Color(0xFFD2A560),
  ];
  Color color1 = Color(0xFFF2E9DC);
  Color color2 = Color(0xFFD2A560);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 7,
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  // Box decoration takes a gradient
                  gradient: LinearGradient(
                    // Where the linear gradient begins and ends
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // Add one stop for each color. Stops should increase from 0 to 1
                    stops: [0.1, 0.5, 0.7, 0.9],
                    colors: intro1ColorGold,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                          top: 80, left: 30, right: 30, bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20, left: 30),
                      child: Text(
                        '2018',
                        style: TextStyle(
                            color: color1,
                            fontWeight: FontWeight.w100,
                            fontSize: 14),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 4, left: 30),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'BMW 320I',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 36),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16, left: 30),
                              child: Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16, left: 6),
                              child: Text(
                                '4.9',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w100,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        )),
                    Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(UtilityString().img_h_car_big),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 30, top: 10),
                          child: Column(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: RichText(
                                  text: TextSpan(children: <TextSpan>[
                                    TextSpan(
                                        text: '\$',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100)),
                                    TextSpan(
                                        text: '180',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 26)),
                                    TextSpan(
                                        text: ' / day',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w100,
                                            fontSize: 14))
                                  ]),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  child: roundShap(Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  child: roundShapNoBorder(Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  child: roundShapNoBorder(Colors.blue),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, position) {
                            return listItem(
                                'Comfort\n',
                                'Auto Gear',
                                Icon(
                                  Icons.airline_seat_recline_normal,
                                  color: color2,
                                  size: 30,
                                ));
                          }),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: SizedBox(
                          width: 200,
                          height: 50,
                          child: RaisedButton(
                            child: Text(
                              UtilityString().strBookCar,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w300),
                            ),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(14),
                                    topLeft: Radius.circular(14))),
                            color: color2,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listItem(String feature1, String feature2, Icon icon) {
    return Container(
      width: 120,
      margin: EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
          color: color1,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Container(
                child: icon,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: feature1,
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.black)),
              TextSpan(
                  text: feature2,
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 14,
                      color: Colors.grey.withOpacity(.50))),
            ])),
          ),
        ],
      ),
    );
  }
}

Widget roundShap(Color color) {
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
      Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border: Border.all(
                color: Colors.white, style: BorderStyle.solid, width: 1)),
      )
    ],
  );
}

Widget roundShapNoBorder(Color color) {
  Color color2 = Color(0xFFD2A560);
  return Stack(
    alignment: Alignment.center,
    children: <Widget>[
      Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
      ),
      Container(
        height: 28,
        width: 28,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.transparent,
            border:
                Border.all(color: color2, style: BorderStyle.solid, width: 1)),
      )
    ],
  );
}
