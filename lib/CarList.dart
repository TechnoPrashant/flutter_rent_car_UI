import 'package:flutter/material.dart';
import 'package:flutter_car_rent_ui/CarDetails.dart';

class CarList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CarlistScreen(),
    );
  }
}

class CarlistScreen extends StatefulWidget {
  @override
  _CarlistScreenState createState() => _CarlistScreenState();
}

class _CarlistScreenState extends State<CarlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: 80, left: 30, right: 30, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Choose a car',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  itemBuilder: (context, position) {
                    return GestureDetector(
                      child: listItem(position),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CarDetailsScreen();
                        }));
                      },
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget listItem(int position) {
    Color color1 = Color(0xFFF2E9DC);
    Color color2 = Color(0xFFD2A560);

    return Stack(
      children: <Widget>[
        Container(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 100),
            width: double.maxFinite,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: color1,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(getCarImage(position))),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 30, left: 30),
          margin: EdgeInsets.only(
            top: 20,
          ),
          width: double.maxFinite,
          child: Align(
            alignment: Alignment.centerLeft,
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: getCarName(position),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      color: Colors.black)),
              TextSpan(
                  text: '\n DIESEL',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 16,
                      color: Colors.grey.withOpacity(.50))),
            ])),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            margin: EdgeInsets.only(top: 170, left: 100),
            width: double.maxFinite,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                '\$12/Day',
                style: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w700, color: color2),
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getCarImage(int position) {
    switch (position) {
      case 0:
        return 'images/l_car1.png';
        break;
      case 1:
        return 'images/l_car2.png';
        break;
      case 2:
        return 'images/l_car3.png';
        break;
      case 3:
        return 'images/l_car4.png';
        break;
    }
  }

  String getCarName(int position) {
    switch (position) {
      case 0:
        return 'Toyota CAMRY';
        break;
      case 1:
        return 'Toyota Fortuner';
        break;
      case 2:
        return 'BMW 320i';
        break;
      case 3:
        return 'Mercedes-Benz GL';
        break;
    }
  }
}
