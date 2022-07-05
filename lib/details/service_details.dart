import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ServiceDetail extends StatefulWidget {
 var snap;
   ServiceDetail({Key? key,required  this.snap}) : super(key: key);


  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
          elevation: 2,
          backgroundColor: Colors.white,
        
        centerTitle: true,
        title: Text('Service Detail',style: TextStyle(color: Colors.black),),
      ),
      body: SafeArea(
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Image.asset(
                'assets/splash.png',
                width: 200,
              )),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Service Type',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                                            fontWeight: FontWeight.w700

                    ),
                  )),
                   SizedBox(
                height: 10,
              ),
             Container(
                  margin: EdgeInsets.only(left: 20),
                  child:  Text(
                               widget.snap['servicetype'] == null
                                ? 'No Data Found'
                                :widget.snap['servicetype'],
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.start,
                            ),),
                SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(left: 20,top: 10),
                  child: Text(
                    'Service Sub Category',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                    ),
                  )),
                    SizedBox(
                height: 10,
              ),
            Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                               widget.snap['serviceSubCategory'] == null
                                ? 'No Data Found'
                                :widget.snap['serviceSubCategory'],
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.start,
                            ),),
                SizedBox(height: 20,),
               Container(
                  margin: EdgeInsets.only(left: 20,top: 10),
                  child: Text(
                    'Service Description',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700

                    ),
                  )),
                  SizedBox(height: 10,),
                   Container(
                  margin: EdgeInsets.only(left: 20),
                  child:Text(
                               widget.snap['description'] == null
                                ? 'No Data Found'
                                :widget.snap['description'],
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.start,
                            ),),
                  SizedBox(height: 20,),
                   Container(
                  margin: EdgeInsets.only(left: 20,top: 10),
                  child: Text(
                    'Service Tax',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700

                    ),
                  )),
                  SizedBox(height: 10,),
                   Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                               widget.snap['tax'] + "%" == null
                                ? 'No Data Found'
                                :widget.snap['tax'] + " %",
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.start,
                            ),),
              // Container(
              //    margin: EdgeInsets.only(left: 15,right: 15),
              //   child: DateTimePicker(
              //     type: DateTimePickerType.dateTimeSeparate,
              //     dateMask: 'd MMM, yyyy',
              //     initialValue: DateTime.now().toString(),
              //     firstDate: DateTime(2000),
              //     lastDate: DateTime(2100),
              //     icon: Icon(Icons.event),
              //     dateLabelText: 'Date',
              //     timeLabelText: "Hour",
              //     selectableDayPredicate: (date) {
              //       // Disable weekend days to select from the calendar
              //       if (date.weekday == 6 || date.weekday == 7) {
              //         return false;
              //       }

              //       return true;
              //     },
              //     onChanged: (val) => print(val),
              //     validator: (val) {
              //       print(val);
              //       return null;
              //     },
              //     onSaved: (val) => print(val),
              //   ),
              // ),
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Price',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.w700
                    ),
                  )),
               Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                               widget.snap['price']  + " AED" == null
                                ? 'No Data Found'
                                :widget.snap['price'] + " AED",
                              style: TextStyle(color: Colors.black, fontSize: 15),
                              textAlign: TextAlign.start,
                            ),),
                SizedBox(height: 20,),
             
            ],
          ),
        ),
    );
  }
}