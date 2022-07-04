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
  var items = [
    'Carpets',
    'Sofas',
    'Matress Shampooing',
  ];
  var itemsArea = [
    'Residential Area',
    'Residential Appartment',
    'Commercial',
    'Residential Villa',
  ];
  String dropdownvalue = 'Carpets';
  String dropdownvalue1 = 'Residential Appartment';

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
                  child: DropdownButton(
                    isExpanded: true,
                  underline: SizedBox(),
                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ),
              ),
                SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(left: 20,top: 10),
                  child: Text(
                    'Select Area',
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
                  child:  DropdownButton(
                // Initial Value
                value: dropdownvalue1,
                  isExpanded: true,
                  underline: SizedBox(),
                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: itemsArea.map((String itemsArea) {
                  return DropdownMenuItem(
                    value: itemsArea,
                    child: Text(itemsArea),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue1 = newValue!;
                  });
                },
              ),),),
                SizedBox(height: 20,),
               Container(
                  margin: EdgeInsets.only(left: 20,top: 10),
                  child: Text(
                    'Time Slots',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  )),
              Container(
                 margin: EdgeInsets.only(left: 15,right: 15),
                child: DateTimePicker(
                  type: DateTimePickerType.dateTimeSeparate,
                  dateMask: 'd MMM, yyyy',
                  initialValue: DateTime.now().toString(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                  icon: Icon(Icons.event),
                  dateLabelText: 'Date',
                  timeLabelText: "Hour",
                  selectableDayPredicate: (date) {
                    // Disable weekend days to select from the calendar
                    if (date.weekday == 6 || date.weekday == 7) {
                      return false;
                    }

                    return true;
                  },
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => print(val),
                ),
              ),
              SizedBox(height: 20,),
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
