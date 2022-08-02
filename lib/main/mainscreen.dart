import 'dart:ui';

import 'package:city_max_admin/bottom_pages/home_page.dart';
import 'package:city_max_admin/bottom_pages/service_page.dart';
import 'package:city_max_admin/bottom_pages/user_appointment_page.dart';
import 'package:city_max_admin/bottom_pages/userlist.dart';
import 'package:flutter/cupertino.dart';
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
  final List<Widget> screens = [
    MyHomePage(),
    ServicePage(),
    UserAppointmentPage(),
    NotificationScreen(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyHomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
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
        controller: _controller,
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
            title: ("Service"),
            activeColorPrimary: Color(0xff0DC6DF),
            inactiveColorPrimary: Color(0xff8d8282),
          ),
          PersistentBottomNavBarItem(
            icon: Image.asset(
              'assets/deadline.png',
              height: 30,
              width: 30,
            ),
            title: ("Appointments"),
            activeColorPrimary: Color(0xff0DC6DF),
            inactiveColorPrimary: Color(0xff8d8282),
          ),
          PersistentBottomNavBarItem(
            icon: Image.asset(
              'assets/notification.png',
              height: 30,
              width: 30,
            ),
            title: ("Notifications"),
            activeColorPrimary: Color(0xff0DC6DF),
            inactiveColorPrimary: Color(0xff8d8282),
          ),
        ],
        screens: [
          MyHomePage(),
          ServicePage(),
          UserAppointmentPage(),
          NotificationScreen(),
          // if user taps on this dashboard tab will be active
        ]);

    Row(

        ///Create Orders

        );

    // return Scaffold(
    //   body: PageStorage(
    //     child: currentScreen,
    //     bucket: bucket,
    //   ),
    //   bottomNavigationBar: BottomAppBar(
    //     color: Colors.white,
    //     child:
    // Container(
    //       height: 60,
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //         children: <Widget>[
    //           MaterialButton(
    //             minWidth: 40,
    //             onPressed: () {
    //               setState(() {
    //                 currentScreen =
    //                     MyHomePage(); // if user taps on this dashboard tab will be active
    //                 currentTab = 0;
    //               });
    //             },
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Image.asset(
    //                   'assets/home.png',
    //                   height: 30,
    //                   width: 30,
    //                 ),
    //                 Text(
    //                   'Home',
    //                   style: TextStyle(
    //                     fontFamily: 'Gilroy',
    //                     fontSize: 10,
    //                     color: currentTab == 0
    //                         ? Color(0xff0DC6DF)
    //                         : Color(0xff8d8282),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),

    //           //Orders
    //           MaterialButton(
    //             minWidth: 40,
    //             onPressed: () {
    //               setState(() {
    //                 currentScreen = ServicePage();
    //                 // if user taps on this dashboard tab will be active
    //                 currentTab = 1;
    //               });
    //             },
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: <Widget>[
    //                 Image.asset(
    //                   'assets/service.png',
    //                   height: 30,
    //                   width: 30,
    //                 ),
    //                 Text(
    //                   'Services',
    //                   style: TextStyle(
    //                     fontFamily: 'Gilroy',
    //                     fontSize: 10,
    //                     color: currentTab == 1
    //                         ? Color(0xff0DC6DF)
    //                         : Color(0xff8d8282),
    //                   ),
    //                 )
    //               ],
    //             ),
    //           ),

    //           Row(
    //             children: [
    //               MaterialButton(
    //                 minWidth: 40,
    //                 onPressed: () {
    //                   setState(() {
    //                     currentScreen =
    //                         UserAppointmentPage(); // if user taps on this dashboard tab will be active
    //                     currentTab = 2;
    //                   });
    //                 },
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    //                     Image.asset(
    //                       'assets/deadline.png',
    //                       height: 30,
    //                       width: 30,
    //                     ),
    //                     Text(
    //                       'Appointment',
    //                       style: TextStyle(
    //                         fontFamily: 'Gilroy',
    //                         fontSize: 10,
    //                         color: currentTab == 2
    //                             ? Color(0xff0DC6DF)
    //                             : Color(0xff8d8282),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),

    //               ///Create Orders
    //               MaterialButton(
    //                 minWidth: 40,
    //                 onPressed: () {
    //                   setState(() {
    //                     currentScreen =
    //                         NotificationScreen(); // if user taps on this dashboard tab will be active
    //                     currentTab = 3;
    //                   });
    //                 },
    //                 child: Column(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: <Widget>[
    //                     Image.asset(
    //                       'assets/notification.png',
    //                       height: 30,
    //                       width: 30,
    //                     ),
    //                     Text(
    //                       'Notification',
    //                       style: TextStyle(
    //                         fontSize: 10,
    //                         fontFamily: 'Gilroy',
    //                         color: currentTab == 3
    //                             ? Color(0xff0DC6DF)
    //                             : Color(0xff8d8282),
    //                       ),
    //                     )
    //                   ],
    //                 ),
    //               ),
    //             ],
    //           )
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
