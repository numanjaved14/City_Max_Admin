import 'package:city_max_admin/bottom_pages/home_page.dart';
import 'package:city_max_admin/bottom_pages/service_page.dart';
import 'package:city_max_admin/bottom_pages/user_appointment_page.dart';
import 'package:city_max_admin/bottom_pages/userlist.dart';
import 'package:city_max_admin/discount/discount_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    MyHomePage(),
    ServicePage(),
    UserAppointmentPage(),
    NotificationScreen(),
    DiscountScreen(),
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyHomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        MyHomePage(); // if user taps on this dashboard tab will be active
                    currentTab = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/home.png',
                      height: 30,
                      width: 30,
                    ),
                    Text("Home")
                  ],
                ),
              ),
              //Service
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = ServicePage();
                    // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/service.png',
                      height: 30,
                      width: 30,
                    ),
                    Text("Service")
                  ],
                ),
              ),

              //Appointment
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen = ServicePage();
                    // if user taps on this dashboard tab will be active
                    currentTab = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/deadline.png',
                      height: 30,
                      width: 30,
                    ),
                    Text("Appointment")
                  ],
                ),
              ),
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        NotificationScreen(); // if user taps on this dashboard tab will be active
                    currentTab = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/notification.png',
                      height: 30,
                      width: 30,
                    ),
                    Text("Notification")
                  ],
                ),
              ),

              ///Create Discount
              MaterialButton(
                minWidth: 40,
                onPressed: () {
                  setState(() {
                    currentScreen =
                        DiscountScreen(); // if user taps on this dashboard tab will be active
                    currentTab = 4;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(
                      'assets/discount.png',
                      height: 30,
                      width: 30,
                    ),
                    Text("Discount")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
