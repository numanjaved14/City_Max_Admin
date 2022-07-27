import 'package:city_max_admin/appointments/apointment_details.dart';
import 'package:city_max_admin/database/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CurrentAppointments extends StatefulWidget {
  const CurrentAppointments({Key? key}) : super(key: key);

  @override
  State<CurrentAppointments> createState() => _CurrentAppointmentsState();
}

class _CurrentAppointmentsState extends State<CurrentAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('orders')
              .where(
                'status',
                isEqualTo: 'pending',
              )
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.docs.length == 0) {
                return Center(
                  child: Text('No Current Appointments'),
                );
              } else {
                return Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     '29 Decemeber 2002',
                    //     textAlign: TextAlign.start,
                    //     style:
                    //         TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                    //   ),
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> snap =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            ApointmentDetails(snap: snap),
                                      ),
                                    );
                                  },
                                  trailing: IconButton(
                                    onPressed: () async {
                                      await Database()
                                          .orderComplete(uuid: snap['uuid']);
                                    },
                                    icon: const Icon(Icons.check),
                                  ),
                                  leading: Text(snap['date']),
                                  title: Text(
                                    'Location: ${snap['loc'].toString().substring(0, 7)}',
                                  ),
                                  subtitle: Text('Price: ${snap['price']} AED'),
                                ),
                                Divider()
                              ],
                            );
                          }),
                    ),
                  ],
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
