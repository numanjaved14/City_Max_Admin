import 'package:city_max_admin/details/service_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShowService extends StatefulWidget {
  var snap;
   ShowService({Key? key,required  this.snap}) : super(key: key);

  @override
  State<ShowService> createState() => _ShowServiceState();
}

class _ShowServiceState extends State<ShowService> {
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
                            trailing:  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
                          ),
       ),
     );
  }
}