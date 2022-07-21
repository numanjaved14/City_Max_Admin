import 'package:city_max_admin/database/database.dart';
import 'package:city_max_admin/main/mainscreen.dart';
import 'package:flutter/material.dart';
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
  TextEditingController discountController = TextEditingController();

  @override
  void dispose() {
    servicCateoryController.dispose();
    serviceSubCateoryController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    vatController.dispose();
    discountController.dispose();
    super.dispose();
  }

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
    'Bathroom',
  ];

  var serviceSuperSubCategorySofas = [
    'Fabric Material',
    'Leather Material',
  ];

  var serviceSuperSubCategoryCarpets = [
    '5 x 10 ft',
    '10 x 15 ft',
  ];

  var serviceSuperSubCategoryCurtainsShampooing = [
    'Small',
    'Medium',
    'Large',
  ];

  var serviceSuperSubCategoryMattressShampooing = [
    'Single',
    'Queen',
    'King',
  ];

  var serviceSuperSubCategoryLLResiApart = [
    'Studio',
    '1BHK',
    '2BHK',
    '3BHK',
    '4BHK',
    '5BHK',
  ];

  var serviceSuperSubCategoryLLResiVila = [
    '2 Bedroom',
    '3 Bedroom',
    '4 Bedroom',
    '5 Bedroom',
    '6 Bedroom',
    '7 Bedroom',
  ];

  var serviceSuperSubCategoryLLCommer = [
    '0-100 SQM',
    '100-200 SQM',
    '200-300 SQM',
    '300-400 SQM',
    '400-500 SQM',
    '500-600 SQM',
    '600-700 SQM',
    '700-800 SQM',
    '800-900 SQM',
    '900-1000 SQM',
    '1000+ SQM',
  ];

  var serviceSuperSubCategoryRAApart = [
    'Studio',
    '1BHK',
    '2BHK',
    '3BHK',
    '4BHK',
    '5BHK',
  ];

  var serviceSuperSubCategoryRAVila = [
    '2 Bedroom',
    '3 Bedroom',
    '4 Bedroom',
    '5 Bedroom',
    '6 Bedroom',
    '7 Bedroom',
  ];

  var serviceSuperSubCategoryCDSmallSpace = [
    '0-100 SQM',
    '100-200 SQM',
    '200-300 SQM',
    '300-400 SQM',
    '400-500 SQM',
  ];

  var serviceSuperSubCategoryCDMediumSpace = [
    '500-600 SQM',
    '600-700 SQM',
    '700-800 SQM',
    '800-900 SQM',
    '900-1000 SQM',
    '1000+ SQM',
  ];

  var serviceSuperSubCategoryDCApart = [
    'Studio',
    '1 Bedroom Apartment',
    '2 Bedroom Apartment',
    '3 Bedroom Apartment',
    '4 Bedroom Apartment',
  ];

  var serviceSuperSubCategoryDCVilla = [
    '2 Bedroom Villa',
    '3 Bedroom Villa',
    '4 Bedroom Villa',
    '5 Bedroom Villa',
  ];

  var serviceSuperSubCategoryDCKitchen = [
    'Small (0-100 Sq.Ft.)',
    'Medium (100-200 Sq.Ft.)',
    'Large (200+ Sq.Ft.)',
  ];

  var serviceSuperSubCategoryDCBath = [
    'Small (0-60 Sq.Ft.)',
    'Medium (60-150 Sq.Ft.)',
    'Large (150+ Sq.Ft.)',
  ];

  var serviceEmpty = [
    'No SubCategory Available',
  ];

  String? _make, _model, _subCat;

  List<String> _selectModel(String? modelName) {
    return modelName == serviceCategory[0]
        ? cleaningSubCaterogy
        : modelName == serviceCategory[1]
            ? longlastingSubCategory
            : modelName == serviceCategory[2]
                ? commercialSubCategory
                : modelName == serviceCategory[3]
                    ? serviceSubCategoryDeep
                    : serviceSubCategoryResdentialArea;
  }

  List<String> _selectSubModel(String? modelName) {
    return modelName == cleaningSubCaterogy[0]
        ? serviceEmpty
        : modelName == cleaningSubCaterogy[1]
            ? serviceEmpty
            : modelName == cleaningSubCaterogy[2]
                ? serviceSuperSubCategorySofas
                : modelName == cleaningSubCaterogy[3]
                    ? serviceSuperSubCategoryCurtainsShampooing
                    : modelName == cleaningSubCaterogy[4]
                        ? serviceSuperSubCategoryMattressShampooing
                        : modelName == cleaningSubCaterogy[5]
                            ? serviceSuperSubCategoryCarpets
                            : modelName == longlastingSubCategory[0]
                                ? serviceSuperSubCategoryLLResiVila
                                : modelName == longlastingSubCategory[1]
                                    ? serviceSuperSubCategoryLLResiApart
                                    : modelName == longlastingSubCategory[1]
                                        ? serviceSuperSubCategoryLLCommer
                                        : modelName == commercialSubCategory[0]
                                            ? serviceSuperSubCategoryCDSmallSpace
                                            : modelName ==
                                                    commercialSubCategory[1]
                                                ? serviceSuperSubCategoryCDMediumSpace
                                                : modelName ==
                                                        serviceSubCategoryDeep[
                                                            0]
                                                    ? serviceSuperSubCategoryDCApart
                                                    : modelName ==
                                                            serviceSubCategoryDeep[
                                                                1]
                                                        ? serviceSuperSubCategoryDCVilla
                                                        : modelName ==
                                                                serviceSubCategoryDeep[
                                                                    2]
                                                            ? serviceSuperSubCategoryDCKitchen
                                                            : modelName ==
                                                                    serviceSubCategoryDeep[
                                                                        3]
                                                                ? serviceSuperSubCategoryDCBath
                                                                : modelName ==
                                                                        serviceSubCategoryResdentialArea[
                                                                            0]
                                                                    ? serviceSuperSubCategoryRAApart
                                                                    : modelName ==
                                                                            serviceSubCategoryResdentialArea[1]
                                                                        ? serviceSuperSubCategoryRAVila
                                                                        : serviceEmpty;
  }

  String dropdownvalue = 'Cleaning';
  String dropdownvalue1 = 'HouseKeeping with Materials';

  @override
  void initState() {
    InItMethod();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Service'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
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
                    border: Border.all(color: Colors.blue)),
                margin: EdgeInsets.only(left: 15, right: 15),
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
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
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
                    border: Border.all(color: Colors.blue)),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButtonFormField<String>(
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
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, top: 10),
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
                    border: Border.all(color: Colors.blue)),
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: DropdownButtonFormField<String>(
                    isExpanded: true,
                    value: _subCat,
                    items: _selectSubModel(_model)
                        .map((label) => DropdownMenuItem(
                              child: Text(label.toString()),
                              value: label,
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _subCat = value;
                        print(value);
                      });
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextField(
                    controller: descriptionController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Service Description',
                    ),
                  ),
                ),
              ),

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
                margin: EdgeInsets.only(left: 15, right: 15),
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
                      hintText: 'Enter Service Price',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Text(
                    'Discount',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  child: TextField(
                    controller: discountController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Service Discount',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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
                margin: EdgeInsets.only(left: 15, right: 15),
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
                      hintText: 'Enter VAT',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    update();
                    Toast.show("Data Is Added",
                        duration: Toast.lengthShort, gravity: Toast.bottom);
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
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void update() async {
    String res = await Database().updateService(
      description: descriptionController.text,
      price: priceController.text,
      vat: vatController.text,
      serviceCategory: _make,
      serviceSubCategory: _model,
      serviceSuperSubCategory: _subCat!,
      uuid: widget.snap['uuid'],
      discount: discountController.text,
    );

    if (res == 'Success') {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MainScreen(),
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res)),
      );
    }
  }

  void InItMethod() {
    _make = widget.snap['servicetype'];
    _model = widget.snap['serviceCategory'];
    _subCat = widget.snap['serviceSubCategory'];
    descriptionController.text =
        widget.snap['description'] == null ? null : widget.snap['description'];
    priceController.text =
        widget.snap['price'] == null ? null : widget.snap['price'];
    vatController.text = widget.snap['tax'] == null ? null : widget.snap['tax'];
    discountController.text =
        widget.snap['discount'] == null ? null : widget.snap['discount'];
  }
}
