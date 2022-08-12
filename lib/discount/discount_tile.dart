import 'package:city_max_admin/discount/discount_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DiscountTile extends StatelessWidget {
  var snap;
  DiscountTile({
    Key? key,
    required this.snap,
  }) : super(key: key);

  bool _isShown = true;
  bool isMount = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10),
      child: Card(
        elevation: 10,
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => DiscountDetails(
                  snap: snap,
                ),
              ),
            );
          },
          title: Text(
            '${snap['servicetype'] ?? 'No Data Found'} : ${snap['serviceCategory'] ?? 'No Data Found'}',
            style: const TextStyle(color: Colors.black, fontSize: 15),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            snap['discount'].toString(),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            textAlign: TextAlign.start,
          ),
          trailing: IconButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("discount")
                  .doc(snap['uuid'])
                  .delete();
            },
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
}
