import 'package:flutter/material.dart';

import '../database/database.dart';

class AddDiscountScreen extends StatefulWidget {
  const AddDiscountScreen({Key? key}) : super(key: key);

  @override
  State<AddDiscountScreen> createState() => _AddDiscountScreenState();
}

class _AddDiscountScreenState extends State<AddDiscountScreen> {
  @override
  void dispose() {
    servicCateoryController.dispose();
    serviceSubCateoryController.dispose();
    discountController.dispose();
    discountController.dispose();
    super.dispose();
  }

  var serviceCategory = [
    'Cleaning',
    'Long-Lasting Disinfection',
    'Commercial Disinfection',
    'Deep Cleaning',
    'Residential Area'
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

  var commercialSubCategory = ['Small Space', 'Medium Space', 'Large Space'];

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

  var serviceSuperSubCategoryCDLargeSpace = [
    '1100-1200 SQM',
    '1200-1300 SQM',
    '1300-1400 SQM',
    '1400-1500 SQM',
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
                                                        commercialSubCategory[2]
                                                    ? serviceSuperSubCategoryCDLargeSpace
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Service'),
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
                        _subCat = null;
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
                    'Select Service Category',
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
                        _subCat = null;
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
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter Discount Percentage',
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
                    addDiscount();
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
      ),
    );
  }

  //TextEditing Controllers
  final servicCateoryController = TextEditingController();
  final serviceSubCateoryController = TextEditingController();

  TextEditingController discountController = TextEditingController();

  void addDiscount() async {
    String res = await Database().addDiscount(
      serviceCategory: _make,
      serviceSubCategory: _model,
      discount: int.parse(discountController.text),
    );

    if (res == 'Success') {
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(res)),
      );
    }
  }
}
