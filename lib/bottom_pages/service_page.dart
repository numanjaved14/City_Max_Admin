import 'package:city_max_admin/add/add_service.dart';
import 'package:city_max_admin/details/service_details.dart';
import 'package:city_max_admin/views/showservice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  var isbool = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        elevation: 2,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/splash.png',
          height: 50,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (builder) => AddService()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 680,
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("Services").snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Some Thing Missing');
              }
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return isbool
                        ? CircularProgressIndicator()
                        : ShowService(snap: snapshot.data!.docs[index]);
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
    //  ListTile(
    //s   onTap: () {
    //  Navigator.push(context, MaterialPageRoute(builder: (builder) => ServiceDetail()));
    // },
    //   leading: const Text('Tuesday'),

    //                               trailing:  IconButton(
    //     onPressed:(){},
    //    icon: Icon(Icons.delete,color: Colors.red,),

    //   ),
    //   title: Text("Service Type"),
    //   subtitle: Text("Selected Area"),),
  }
}
