import 'package:MyAppToShowMySkills/pages/home_page/home_page_template.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardHome extends StatefulWidget {
  @override
  DashBoardHomeState createState() => new DashBoardHomeState();
}

class DashBoardHomeState extends State<DashBoardHome> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1336);

    return Scaffold(
      backgroundColor: Color(0xff392850),
      body: Column(
        children: <Widget>[
          HomePageForm(),
        ],
      ),
    );
  }
}
