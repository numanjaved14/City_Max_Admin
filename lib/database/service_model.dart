import 'package:cloud_firestore/cloud_firestore.dart';

class ServiceModel {
  var servicetype;
  var serviceSubCategory;
  String description;
  String price;
  String tax;

  ServiceModel({
    required this.servicetype,
    required this.serviceSubCategory,
    required this.description,
    required this.price,
    required this.tax,
  });

  Map<String, dynamic> toJson() => {
        'servicetype': servicetype,
        'serviceSubCategory': serviceSubCategory,
        'description': description,
        'price': price,
        'tax': tax,
      };

  static ServiceModel fromSnap(DocumentSnapshot snap) {
    var snapShot = snap.data() as Map<String, dynamic>;

    return ServiceModel(
      servicetype: snapShot['servicetype'],
      serviceSubCategory: snapShot['serviceSubCategory'],
      description: snapShot['description'],
      price: snapShot['price'],
      tax: snapShot['tax'],
    );
  }
}
