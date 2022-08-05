import 'package:city_max_admin/details/service_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ShowService extends StatefulWidget {
  var snap;
  ShowService({Key? key, required this.snap}) : super(key: key);

  @override
  State<ShowService> createState() => _ShowServiceState();
}

class _ShowServiceState extends State<ShowService> {
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
                builder: (builder) => ServiceDetail(
                  snap: widget.snap,
                ),
              ),
            );
          },
          title: Text(
            '${widget.snap['servicetype'] ?? 'No Data Found'} : ${widget.snap['serviceCategory'] ?? 'No Data Found'}',
            style: const TextStyle(color: Colors.black, fontSize: 15),
            textAlign: TextAlign.start,
          ),
          subtitle: Text(
            widget.snap['serviceSubCategory'] ?? 'No Data Found',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
            ),
            textAlign: TextAlign.start,
          ),
          trailing: IconButton(
            onPressed: () {
              FirebaseFirestore.instance
                  .collection("Services")
                  .doc(widget.snap['uuid'])
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
