import 'package:city_max_admin/database/service_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';

class Database {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  //Add Service
  Future<String> addService({
    required String price,
    required String description,
    required String vat,
    required serviceCategory,
    required serviceSubCategory,
    required serviceSuperSubCategory,
    required discount,
  }) async {
    String res = 'Some error occured.';
    try {
      if (price.isNotEmpty ||
          description.isNotEmpty ||
          vat.isNotEmpty ||
          serviceCategory.isNotEmpty ||
          serviceSubCategory.isNotEmpty ||
          serviceSuperSubCategory.isNotEmpty) {
        String servicId = Uuid().v1();

        ServiceModel serviceModel = ServiceModel(
          description: description,
          tax: vat,
          price: price,
          serviceCategory: serviceSubCategory,
          servicetype: serviceCategory,
          uuid: servicId,
          serviceSubCategory: serviceSuperSubCategory,
          discount: discount,
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
    required String serviceSuperSubCategory,
    required serviceCategory,
    required serviceSubCategory,
    required discount,
    required uuid,
  }) async {
    String res = 'Some error occured.';
    try {
      if (price.isNotEmpty ||
          description.isNotEmpty ||
          vat.isNotEmpty ||
          serviceCategory.isNotEmpty ||
          serviceSubCategory.isNotEmpty ||
          serviceSuperSubCategory.isNotEmpty) {
        // String servicId = Uuid().v1();

        ServiceModel serviceModel = ServiceModel(
          description: description,
          tax: vat,
          price: price,
          serviceSubCategory: serviceSuperSubCategory,
          serviceCategory: serviceSubCategory,
          servicetype: serviceCategory,
          uuid: uuid,
          discount: discount,
        );

        _firebaseFirestore.collection('Services').doc(uuid).update(
              serviceModel.toJson(),
            );
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  //Mark Order as Complete
  Future<String> orderComplete({
    required uuid,
  }) async {
    String res = 'Some error occured.';
    try {
      if (uuid.isNotEmpty) {
        _firebaseFirestore.collection('orders').doc(uuid).update({
          'status': 'compete',
        });
        res = 'Success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }
}
