import 'package:MyAppToShowMySkills/routes/navigation.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  void startTimer() {
    Timer(Duration(seconds: 5), () {
      return Keys.navKey.currentState.popAndPushNamed("/sign_in_container");
    });
  }

  @override
  initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1336);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/images/splash_screen.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: ScreenUtil().setHeight(990),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "I don't give a fuck,asm punk!",
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontFamily: "TitilliumWeb",
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(50),
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  height: ScreenUtil().setHeight(260),
                  width: ScreenUtil().setWidth(700),
                  child: FlareActor(
                    "assets/flr/229_Design Thinking.flr",
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "229_Design Thinking",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
