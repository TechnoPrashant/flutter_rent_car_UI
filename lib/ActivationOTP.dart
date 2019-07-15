import 'package:flutter/services.dart';

import 'utility/UtilityString.dart';
import 'package:flutter/material.dart';
import 'package:flutter_car_rent_ui/Intro.dart';

class ActivationOTP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: ActivationOTPScreen(),
    );
  }
}

class ActivationOTPScreen extends StatefulWidget {
  @override
  _ActivationOTPScreenState createState() => _ActivationOTPScreenState();
}

class _ActivationOTPScreenState extends State<ActivationOTPScreen> {
  Color color1 = Color(0xFFCEA05F);
  final FocusNode _firstInputFocusNode = new FocusNode();
  final FocusNode _secondInputFocusNode = new FocusNode();
  final FocusNode _thirdInputFocusNode = new FocusNode();
  final FocusNode _fourthInputFocusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
        height: double.maxFinite,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 80, left: 30),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 40, top: 100),
                    child: Text(
                      UtilityString().strActivationCode,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 20,
                        left: screenWidth / 10,
                        right: screenWidth / 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        textFieldOTP(_firstInputFocusNode, 1),
                        textFieldOTP(_secondInputFocusNode, 2),
                        textFieldOTP(_thirdInputFocusNode, 3),
                        textFieldOTP(_fourthInputFocusNode, 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 100, left: 50),
                child: Align(
                  alignment: FractionalOffset.bottomRight,
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: RaisedButton(
                      child: Text(
                        UtilityString().strNext,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return IntroScreen();
                        }));
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10))),
                      color: color1,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget textFieldOTP(FocusNode covariant, int txtfieldPostion) {
    return Flexible(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: color1.withOpacity(0.50),
                  borderRadius: BorderRadius.all(Radius.circular(5))),
              width: 60,
              height: 60,
              child: TextField(
                focusNode: covariant,
                keyboardType: TextInputType.phone,
                keyboardAppearance: Brightness.light,
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                    color: color1, fontSize: 24, fontWeight: FontWeight.w500),
                inputFormatters: [
                  LengthLimitingTextInputFormatter(1),
                ],
                obscureText: true,
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                ),
                onEditingComplete: () {
                  switch (txtfieldPostion) {
                    case 1:
                      FocusScope.of(context)
                          .requestFocus(_secondInputFocusNode);
                      break;
                    case 2:
                      FocusScope.of(context).requestFocus(_thirdInputFocusNode);
                      break;
                    case 3:
                      FocusScope.of(context)
                          .requestFocus(_fourthInputFocusNode);
                      break;
                  }
                },
              ))
        ],
      ),
    );
  }
}
