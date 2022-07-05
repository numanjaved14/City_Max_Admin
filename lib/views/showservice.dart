import 'package:city_max_admin/details/service_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:uuid/uuid.dart';

class ShowService extends StatefulWidget {
  var snap;
   ShowService({Key? key,required  this.snap}) : super(key: key);

  @override
  State<ShowService> createState() => _ShowServiceState();
}

class _ShowServiceState extends State<ShowService> {
    bool _isShown = true;

  @override
  Widget build(BuildContext context) {
    return    
     Container(
      margin: EdgeInsets.only(left: 10,right: 10),
       child: Card(
        elevation: 10,
         shape: BeveledRectangleBorder(
    borderRadius: BorderRadius.circular(10.0),
  ),
         child: ListTile(
           onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder) => ServiceDetail(snap: widget.snap,)));
           },
                            
                            title: Text(
                               widget.snap['servicetype'] == null
                                ? 'No Data Found'
                                :widget.snap['servicetype'],
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.start,
                            ),
                            subtitle: Text(
                              widget.snap['serviceSubCategory'] == null
                                ? 'No Data Found'
                                :widget.snap['serviceSubCategory'],
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.start,
                            ),
                            trailing:  IconButton(onPressed: (){
                               _delete(context);
                            }, icon: Icon(Icons.delete,color: Colors.red,))
                          ),
       ),
     );
  }
 void _delete(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Please Confirm'),
            content: const Text('Are you sure to remove the service',style: TextStyle(fontSize: 13,fontWeight: FontWeight.w700),),
            actions: [
              // The "Yes" button
              TextButton(
                  onPressed: () {
                    // Remove the box
                    setState(() {
                     
                       FirebaseFirestore.instance.collection("Services").doc(widget.snap['uuid'])
                                          
                                          .delete();
                    });

                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('Yes')),
              TextButton(
                  onPressed: () {
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: const Text('No'))
            ],
          );
        });
  }
 
  
 
}