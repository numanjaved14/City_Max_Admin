import 'package:city_max_admin/database/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class Database{
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  
  //Add Service
  Future<String> addService({
    required String price,
    required String description,
    required String vat,
    required serviceCategory,
    required serviceSubCategory,
  }) async {
    String res = 'Some error occured.';
    try {
      if (price.isNotEmpty ||
          description.isNotEmpty ||
          vat.isNotEmpty ||
          serviceCategory.isNotEmpty ||
          serviceSubCategory.isNotEmpty) {
     
  String servicId = Uuid().v1();

        ServiceModel serviceModel = ServiceModel(
          description: description,
          tax: vat,
          price: price,
          serviceSubCategory: serviceSubCategory,
          servicetype: serviceCategory,
          uuid: servicId
        
        );

      

        _firebaseFirestore.collection('Services').doc(servicId).set(
              serviceModel.toJson(),
            );
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  //Update
   Future<String> updateService({
    required String price,
    required String description,
    required String vat,
    required serviceCategory,
    required serviceSubCategory,
  }) async {
    String res = 'Some error occured.';
    try {
      if (price.isNotEmpty ||
          description.isNotEmpty ||
          vat.isNotEmpty ||
          serviceCategory.isNotEmpty ||
          serviceSubCategory.isNotEmpty) {
     
  String servicId = Uuid().v1();

        ServiceModel serviceModel = ServiceModel(
          description: description,
          tax: vat,
          price: price,
          serviceSubCategory: serviceSubCategory,
          servicetype: serviceCategory,
          uuid: servicId
        
        );

      

        _firebaseFirestore.collection('Services').doc(servicId).update({
            "tax" :  vat

        }
             
            );
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }


}