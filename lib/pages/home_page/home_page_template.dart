import 'package:MyAppToShowMySkills/routes/navigation.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Items {
  String title;
  String subtitle;
  String animation;
  String img;
  String route;
  Items({
    this.title,
    this.subtitle,
    this.img,
    this.animation,
    this.route,
  });
}

class HomePageForm extends StatelessWidget {
  DateTime now = new DateTime.now();

  Items item1 = Items(
    title: "Calendar",
    subtitle: "now",
    img: "assets/flr/Calendario.flr",
    animation: "Untitled",
    route: "/calendar_container",
  );

  Items item2 = Items(
    title: "To Do!",
    subtitle: "get your shit done!",
    img: "assets/flr/infinite-list.flr",
    animation: "Untitled",
    route: "/to_do_container",
  );
  Items item3 = Items(
    title: "Settings",
    subtitle: "Don't Touch",
    img: "assets/flr/settings.flr",
    animation: "spin2",
    route: "/settings_container",
  );
  Items item4 = Items(
    title: "Profile",
    subtitle: "Look at your dull life",
    img: "assets/flr/Robot Animation.flr",
    animation: "Blink",
    route: "/profile_container",
  );
  Items item5 = Items(
    title: "Message",
    subtitle: "Always be empty",
    img: "assets/flr/email_sending_progress_2.flr",
    animation: "start",
    route: "/message_container",
  );
  Items item6 = Items(
    title: "Maps",
    subtitle: "Find yot Way (better in Life...)",
    img: "assets/flr/maps_loader.flr",
    animation: "anim",
    route: "/maps_container",
  );
  Items item7 = Items(
    title: "Games",
    subtitle: "If You have A lot Of Free Time",
    img: "assets/flr/go to game.flr",
    animation: "float",
    route: "/games_container",
  );
  Items item8 = Items(
    title: "Feeds",
    subtitle: "What's happen in the world",
    img: "assets/flr/NewsMedia.flr",
    animation: "Untitled",
    route: '/feeds_container',
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [
      item1,
      item2,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8,
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 10, right: 10),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data) {
            return InkWell(
              onTap: () {
                Keys.navKey.currentState.pushNamed(data.route);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: ScreenUtil().setHeight(200),
                      width: ScreenUtil().setWidth(200),
                      child: FlareActor(
                        data.img,
                        alignment: Alignment.center,
                        fit: BoxFit.contain,
                        animation: data.animation,
                      ),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(14)),
                    Text(
                      data.title,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: ScreenUtil().setSp(20),
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(8)),
                    Text(
                      data.subtitle,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w900),
                    ),
                    SizedBox(height: ScreenUtil().setHeight(14)),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
