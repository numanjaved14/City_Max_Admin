import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'apointment_details.dart';

class PastApointment extends StatefulWidget {
  const PastApointment({Key? key}) : super(key: key);

  @override
  State<PastApointment> createState() => _PastApointmentState();
}

class _PastApointmentState extends State<PastApointment> {
  TextEditingController _reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('orders')
                  // .where(
                  //   'status',
                  //   isNotEqualTo: 'pending',
                  // )

                  .snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return const Center(
                    child: Text('Something went wrong'),
                  );
                }
                if (snapshot.hasData) {
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
                                    leading: Text(snap['date']),
                                    trailing: snap['status'] == 'pending'
                                        ? Text('Not Completed')
                                        : TextButton(
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return Dialog(
                                                      shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                  20.0)), //this right here
                                                      child: Container(
                                                        height: 200,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Center(
                                                                child: snap['reviw'] ==
                                                                        ''
                                                                    ? Text(
                                                                        'No Review')
                                                                    : Text(
                                                                        snap[
                                                                            'review'],
                                                                      ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  });
                                            },
                                            child: Text(
                                              'Review',
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          ),
                                    title: Text(
                                      'Location: ${snap['loc'].toString().substring(0, 7)}',
                                    ),
                                    subtitle:
                                        Text('Price: ${snap['price']} AED'),
                                  ),
                                  Divider()
                                ],
                              );
                            }),
                      ),
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }
              })),
    );
  }
}
