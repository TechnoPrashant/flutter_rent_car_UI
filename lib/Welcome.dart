import 'package:flutter/material.dart';
import 'package:flutter_car_rent_ui/LoginScreen.dart';
import 'utility/UtilityString.dart';
import 'package:flutter_car_rent_ui/Register.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Color color1 = Color(0xFFCEA05F);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 160, left: 30),
            child: Image.asset(
              UtilityString().imgLogoTheme,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 20),
            child: Text(
              UtilityString().strWelcome,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 46,
                  fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 8),
            child: Text(
              UtilityString().strCreateAccount,
              style: TextStyle(
                color: Colors.grey[350],
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          Container(
            margin: EdgeInsets.only(left: 40),
            child: Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: RaisedButton(
                  child: Text(UtilityString().strLogin),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Login();
                    }));
                  },
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          topLeft: Radius.circular(10))),
                  color: color1,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 90),
            margin: EdgeInsets.only(top: 20),
            child: Row(
              children: <Widget>[
                Text(
                  UtilityString().strNoAccount,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Register();
                    }));
                  },
                  child: Text(
                    UtilityString().strRegister,
                    style: TextStyle(color: color1, fontSize: 18),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
