import 'package:city_max_admin/main/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:date_time_picker/date_time_picker.dart';

class AddService extends StatefulWidget {
  const AddService({Key? key}) : super(key: key);

  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  var serviceCategory = [
    'Cleaning',
    'Long-lasting Distintion',
    'Commercial Disinfection',
    'Deep Cleaning',
    'Resdential Area'
  ];

  var cleaningSubCaterogy = [
    'HouseKeeping with Materials',
    'HouseKeeping without Materials',
    'Sofas',
    'Curtains Shampooing',
    'Mattress Shampooing',
    'Carpets'
  ];

  var longlastingSubCategory = [
    'Residential Villa',
    'Residential Appartments',
    'Commercial',
  ];

  var serviceSubCategoryResdentialArea = [
    
    'Appartments',
    'Villas',
  ];

  var commercialSubCategory = [
 'Small Space',
    'Medium Space',
    'Large Space',
  ];
  var serviceSubCategoryDeep = [
  
    'Appartments',
    'Villas',
    'Kitchen',
    'Bathroom'
  ];

  String? _make, _model;
  List<String> _selectModel(String? modelName) {
    return
     modelName == serviceCategory[0]
        ? cleaningSubCaterogy
        : modelName == serviceCategory[1]
            ? longlastingSubCategory
            : modelName == serviceCategory[2] ? commercialSubCategory : modelName == serviceCategory[3] ? serviceSubCategoryDeep : serviceSubCategoryResdentialArea;
  }
  String dropdownvalue = 'Cleaning';
  String dropdownvalue1 = 'HouseKeeping with Materials';

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Service'),
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
                    'Select Service Type',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  )),
                   SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue
                  )
                ),
                margin: EdgeInsets.only(left: 15,right: 15),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButtonFormField<String>(
                                        isExpanded: true,

          value: _make,
          items: serviceCategory
              .map((label) => DropdownMenuItem(
                    child: Text(label.toString()),
                    value: label,
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _make = value;
              _model = null;
              print(value);
            });
          },
        ),
                ),
              ),
                SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(left: 20,top: 10),
                  child: Text(
                    'Select Service SubCategory',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  )),
                    SizedBox(
                height: 10,
              ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.blue
                  )
                ),
                margin: EdgeInsets.only(left: 15,right: 15),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:  DropdownButtonFormField<String>(
                    isExpanded: true,
          value: _model,
          items: _selectModel(_make)
              .map((label) => DropdownMenuItem(
                    child: Text(label.toString()),
                    value: label,
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              _model = value;
              print(value);
            });
          },
        ),),),
                SizedBox(height: 20,),
              //  Container(
              //     margin: EdgeInsets.only(left: 20,top: 10),
              //     child: Text(
              //       'Time Slots',
              //       textAlign: TextAlign.right,
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 17,
              //       ),
              //     )),
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
              // SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Price',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  )),
              Container(
                                 margin: EdgeInsets.only(left: 15,right: 15),

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffix: Text(
                        'AED',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Enter Service Price',
                    ),
                  ),
                ),
              ),
                SizedBox(height: 20,),
                  Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'VAT',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  )),
                   Container(
                                 margin: EdgeInsets.only(left: 15,right: 15),

                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      suffix: Text(
                        'VAT',
                        style: TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                      ),
                      border: OutlineInputBorder(),
                      hintText: 'Enter VAT',
                    ),
                  ),
                ),
              ),
                                  SizedBox(height: 20,),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => MainScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                      primary: Color(0xff0DC6DF),
                      fixedSize: Size(300, 60)),
                  child: Text(
                    'Add',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
