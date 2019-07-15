import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_car_rent_ui/CarList.dart';

class ChooseCar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChooseCarScreen(),
    );
  }
}

class ChooseCarScreen extends StatefulWidget {
  @override
  _ChooseCarScreenState createState() => _ChooseCarScreenState();
}

class _ChooseCarScreenState extends State<ChooseCarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {},
                initialCameraPosition:
                    CameraPosition(target: LatLng(22.3039, 70.8022), zoom: 8),
                compassEnabled: true,
                mapType: MapType.normal,
                myLocationEnabled: true,
                zoomGesturesEnabled: true,
              ),
            ),
          ),
          Positioned(
              child: Container(
            margin: EdgeInsets.only(bottom: 80),
            child: Align(
              alignment: FractionalOffset.bottomRight,
              child: SizedBox(
                height: 180,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, position) {
                      return GestureDetector(
                        child: listItem(position),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return CarlistScreen();
                          }));
                        },
                      );
                    }),
              ),
            ),
          )),
        ],
      ),
    );
  }

  Widget listItem(int position) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(left: 14),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 10, top: 20),
            child: RichText(
                text: TextSpan(children: <TextSpan>[
              TextSpan(
                  text: carCategory(position),
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      color: Colors.black)),
              TextSpan(
                  text: '\n12 CARS NEARBY',
                  style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 14,
                      color: Colors.grey.withOpacity(.50))),
            ])),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              child: Image.asset(imageURL(position)),
            ),
          )
        ],
      ),
    );
  }

  String imageURL(int position) {
    if (position % 2 == 0) {
      return 'images/h_car_black.png';
      // You won't get here
    } else {
      return 'images/h_car_gold.png';
    }
  }

  String carCategory(int position) {
    if (position % 2 == 0) {
      return 'Sports cars';
      // You won't get here
    } else {
      return 'S class';
    }
  }
}
