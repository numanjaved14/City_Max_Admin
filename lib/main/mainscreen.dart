import 'dart:ui';

import 'package:city_max_admin/bottom_pages/home_page.dart';
import 'package:city_max_admin/bottom_pages/service_page.dart';
import 'package:city_max_admin/bottom_pages/user_appointment_page.dart';
import 'package:city_max_admin/bottom_pages/userlist.dart';
import 'package:city_max_admin/discount/discount_screen.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Properties & Variables needed
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = const [
    MyHomePage(),
    ServicePage(),
    UserAppointmentPage(),
    NotificationScreen(),
    DiscountScreen(),
  ]; // to store nested tabs

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PersistentTabView(
      controller: _controller,
      screens: screens,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      context,
      // items: [],
      items: [
        PersistentBottomNavBarItem(
          icon: Image.asset(
            'assets/home.png',
            height: 30,
            width: 30,
          ),
          title: ("Home"),
          activeColorPrimary: Color(0xff0DC6DF),
          inactiveColorPrimary: Color(0xff8d8282),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            'assets/service.png',
            height: 30,
            width: 30,
          ),
          title: ("Services"),
          activeColorPrimary: Color(0xff0DC6DF),
          inactiveColorPrimary: Color(0xff8d8282),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            'assets/deadline.png',
            height: 30,
            width: 30,
          ),
          title: ("Appointment"),
          activeColorPrimary: Color(0xff0DC6DF),
          inactiveColorPrimary: Color(0xff8d8282),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            'assets/notification.png',
            height: 30,
            width: 30,
          ),
          title: ("Notification"),
          activeColorPrimary: Color(0xff0DC6DF),
          inactiveColorPrimary: Color(0xff8d8282),
        ),
        PersistentBottomNavBarItem(
          icon: Image.asset(
            'assets/discount.png',
            height: 30,
            width: 30,
          ),
          title: ("Discount"),
          activeColorPrimary: Color(0xff0DC6DF),
          inactiveColorPrimary: Color(0xff8d8282),
        ),
      ],
    ));
  }
}
