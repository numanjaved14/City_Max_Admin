import 'package:city_max_admin/appointments/currentappointments.dart';
import 'package:flutter/material.dart';

import '../appointments/pastappointments.dart';

class UserAppointmentPage extends StatefulWidget {
  const UserAppointmentPage({Key? key}) : super(key: key);

  @override
  State<UserAppointmentPage> createState() => _UserAppointmentPageState();
}

class _UserAppointmentPageState extends State<UserAppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Appointments'),
          bottom: const TabBar(
            labelPadding: EdgeInsets.all(12),
            tabs: <Widget>[
              Tab(
                text: 'Current Appointments',
              ),
              Tab(
                text: 'Past Appointments',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CurrentAppointments(),
            PastApointment(),
          ],
        ),
      ),
    );
  }
}
