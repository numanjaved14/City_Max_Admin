import 'package:city_max_admin/details/currentappointmentdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CurrentAppointments extends StatefulWidget {
  const CurrentAppointments({Key? key}) : super(key: key);

  @override
  State<CurrentAppointments> createState() => _CurrentAppointmentsState();
}

class _CurrentAppointmentsState extends State<CurrentAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
          children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('29 Decemeber 2002',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                              ),

            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                       
                        ListTile(
                        
                            leading: const Text('12/21/2022'),
                            
                            trailing:  TextButton(
                              onPressed:(){
                                                          Navigator.push(context, MaterialPageRoute(builder: (builder) => AppointCurrentDetail())); 

                              },
                             child: Text('Detais')
                             
                            ),
                            title: Text("Fawad Kaleem"),
                            subtitle: Text("234 B Eid Gah Road Lahore"),),
                            Divider()
                      ],
                    );
                        
                  }),
            ),
          ],
        ),),
    );
  }
}