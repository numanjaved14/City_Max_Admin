import 'package:city_max_admin/database/database.dart';
import 'package:city_max_admin/main/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toast/toast.dart';

class ServiceEdit extends StatefulWidget {
  var snap;
   ServiceEdit({Key? key, required this.snap}) : super(key: key);

  @override
  State<ServiceEdit> createState() => _ServiceEditState();
}

class _ServiceEditState extends State<ServiceEdit> {
  final servicCateoryController = TextEditingController();
        final serviceSubCateoryController = TextEditingController();

    TextEditingController descriptionController = TextEditingController();
    TextEditingController priceController = TextEditingController();
    TextEditingController vatController = TextEditingController();

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
      body: SingleChildScrollView(
        child: SafeArea(
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
                      'Description',
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
                      controller: descriptionController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
      
                        border: OutlineInputBorder(),
                        hintText: widget.snap['description'] == null
                                ? 'No Data Found'
                                :widget.snap['description'],
                      ),
                    ),
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
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffix: Text(
                          'AED',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        border: OutlineInputBorder(),
                        hintText: widget.snap['price'] == null
                                ? 'No Data Found'
                                :widget.snap['price'],
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
                      controller: vatController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        suffix: Text(
                          'VAT',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                        border: OutlineInputBorder(),
                        hintText: widget.snap['tax'] == null
                                ? 'No Data Found'
                                :widget.snap['tax'],
                      ),
                    ),
                  ),
                ),
                                    SizedBox(height: 20,),
      
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                     update();
                     Toast.show("Data Is Added", duration: Toast.lengthShort, gravity:  Toast.bottom);

                    },
                    style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        primary: Color(0xff0DC6DF),
                        fixedSize: Size(300, 60)),
                    child: Text(
                      'UpDate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                     SizedBox(height: 20,),
              ],

            ),
          ),
      ),
      
    );
  }
  
   void update() async{
    String res = await Database().updateService(
      description:descriptionController.text, price: priceController.text,
      vat: vatController.text,
      serviceCategory: _make,
      serviceSubCategory: _model

    );
  


    if (res == 'Success') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) =>  MainScreen(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res)),
      );
    }
 }
}