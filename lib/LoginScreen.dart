import 'package:flutter/material.dart';
import 'package:flutter_car_rent_ui/utility/UtilityString.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color color1 = Color(0xFFCEA05F);

  @override
  Widget build(BuildContext context) {
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
                padding: EdgeInsets.only(left: 30, top: 60),
                child: Text(
                  UtilityString().strWelcomeBack,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30, top: 60),
                child: Text(
                  UtilityString().strPhoneNumber,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: TextField(
                    cursorColor: color1,
                    keyboardType: TextInputType.number,
                    maxLines: 1,
                    keyboardAppearance: Brightness.light,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color1)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: color1)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: color1)),
                        hintText: UtilityString().hintPhoneNumber),
                  )),
            ],
          )),
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
                      UtilityString().strLogin,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500),
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Login();
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
      ),
    );
  }
}
