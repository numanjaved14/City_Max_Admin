import 'package:city_max_admin/appointments/currentappointments.dart';
import 'package:city_max_admin/appointments/pastappointments.dart';
import 'package:city_max_admin/auth/login_Screen.dart';
import 'package:city_max_admin/bottom_pages/service_page.dart';
import 'package:city_max_admin/bottom_pages/user_appointment_page.dart';
import 'package:city_max_admin/bottom_pages/userlist.dart';
import 'package:city_max_admin/review/reviews.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/splash.png',
          height: 50,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (builder) => Login_Screen())));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.blue,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (builder) => ServicePage()));
                },
                child: Container(
                  width: 150,
                  height: 210,
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/service.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Servcies',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              // ignore: sized_box_for_whitespace
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => UserAppointmentPage()));
                },
                child: Container(
                  width: 150,
                  height: 210,
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/deadline.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Appointments',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => PastApointment()));
                },
                child: Container(
                  width: 150,
                  height: 210,
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/rating.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Reviews',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (builder) => NotificationScreen()));
                },
                child: Container(
                  width: 150,
                  height: 210,
                  child: Card(
                    elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/notification.png'),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Notifications',
                            style: TextStyle(fontWeight: FontWeight.w800),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
