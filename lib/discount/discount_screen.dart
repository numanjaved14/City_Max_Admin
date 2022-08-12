import 'package:city_max_admin/discount/add_discount_screen.dart';
import 'package:city_max_admin/discount/discount_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiscountScreen extends StatefulWidget {
  const DiscountScreen({Key? key}) : super(key: key);

  @override
  State<DiscountScreen> createState() => _DiscountScreenState();
}

class _DiscountScreenState extends State<DiscountScreen> {
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
          Navigator.push(context,
              MaterialPageRoute(builder: (builder) => AddDiscountScreen()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 680,
          child: StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection("discount").snapshots(),
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
                        : DiscountTile(snap: snapshot.data!.docs[index]);
                  },
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}
