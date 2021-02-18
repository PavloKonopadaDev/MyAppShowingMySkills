import 'package:MyAppToShowMySkills/pages/home_page/calendar_pages/@calendar_page_container.dart';
import 'package:MyAppToShowMySkills/pages/home_page/feeeds_pages/@feeds_page_container.dart';
import 'package:MyAppToShowMySkills/pages/home_page/games_pages/@games_page_container.dart';
import 'package:MyAppToShowMySkills/pages/home_page/home_page_form.dart';
import 'package:MyAppToShowMySkills/pages/home_page/maps_pages/@maps_page_container.dart';
import 'package:MyAppToShowMySkills/pages/home_page/message_pages/@message_page_container.dart';
import 'package:MyAppToShowMySkills/pages/home_page/profile_pages/@profile_page_container.dart';
import 'package:MyAppToShowMySkills/pages/home_page/settings_pages/@settings_page_container.dart';
import 'package:MyAppToShowMySkills/pages/home_page/todo_pages/@todo_page_container.dart';
import 'package:MyAppToShowMySkills/pages/sign_pages/forgot_password/@forgot_password_container.dart';
import 'package:MyAppToShowMySkills/pages/sign_pages/sign_in/@sign_in_container.dart';
import 'package:MyAppToShowMySkills/pages/sign_pages/sign_up/@sign_up_container.dart';
import 'package:MyAppToShowMySkills/pages/splash_screen/splash_screen.dart';
import 'package:MyAppToShowMySkills/routes/navigation.dart';
import 'package:flutter/material.dart';

final routes = {
  Routes.splash_Screen: (BuildContext context) => SplashScreenPage(),
  Routes.sign_in_page: (BuildContext context) => SignInContainer(),
  Routes.sign_up_page: (BuildContext context) => SignUpContainer(),
  Routes.forgot_details: (BuildContext context) => ForgotPasswordContainer(),
  Routes.home: (BuildContext context) => DashBoardHome(),
  Routes.to_do: (BuildContext context) => ToDoContainer(),
  Routes.settings: (BuildContext context) => SettingsContainer(),
  Routes.profile: (BuildContext context) => ProfileContainer(),
  Routes.games: (BuildContext context) => GamesContainer(),
  Routes.message: (BuildContext context) => MessageContainer(),
  Routes.maps: (BuildContext context) => MapContainer(),
  Routes.calendar: (BuildContext context) => CalendarContainer(),
  Routes.feeds: (BuildContext context) => FeedsPageContainer(),
};
